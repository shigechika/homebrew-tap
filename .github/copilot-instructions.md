# Repository overview

`homebrew-tap` is the Homebrew tap `shigechika/tap`: Ruby formulae under
`Formula/` packaging four of the maintainer's own tools. Three are Python
CLIs from PyPI (`junos-ops`, `mcp-stdio`, `speedtest-z`) built with
`Language::Python::Virtualenv` / `virtualenv_install_with_resources`, where
every `resource` block pins one PyPI sdist (`url` + `sha256`). The fourth,
`gws-mcp`, is a prebuilt Rust binary with four per-platform `url`/`sha256`
pairs (`on_macos`/`on_linux` × `on_arm`/`on_intel`) and is **not** part of
the Python tooling below.

Most commits to `Formula/*.rb` are made by workflows, not humans:
`update-formula.yml` regenerates a Python formula with `homebrew-pypi-poet`
on each upstream PyPI release, and `bottle.yml` builds bottles and writes the
`bottle do` block. Human PRs here mostly change the workflows themselves or
the patch scripts embedded in them.

See `CLAUDE.md` for the authoritative architecture notes (auto-update flow,
bottle conventions, gws-mcp's separate pipeline) — read it before reviewing
workflow changes.

# Build & validate

```bash
brew install --build-from-source ./Formula/<package>.rb   # local build test
brew audit --strict --new Formula/<package>.rb            # audit a formula
brew style Formula/<package>.rb                           # RuboCop style
```

CI (`.github/workflows/lint.yml`) registers the checkout as a tap via
`Homebrew/actions/setup-homebrew@main`, then runs
`brew audit --strict shigechika/tap/<name>` for every formula and
`brew style shigechika/tap` over the whole tap. `brew style` on the tap also
shellchecks the shell scripts embedded in the workflow YAML — that's why
`update-formula.yml` carries a `# shellcheck disable=SC2016` comment. Those
two commands are the entire style contract; there is no separate
RuboCop/prettier/ruff config to enforce.

**Caveat that shapes review:** `lint.yml`'s `push` trigger never fires on the
bot commits from `update-formula.yml` / `bottle.yml` — they push with the
default `GITHUB_TOKEN`, and GitHub's recursion guard suppresses workflow
triggers. That's why both workflows run `brew style` + `brew audit --strict`
inline, after the local commit but before the push. Those inline gates are
the only automated check on the auto-generated formulae.

# What to focus review on in this repo

## 1. `url` / `sha256` / `version` integrity is the core review surface

- Python formulae: the top-level `url`+`sha256` and every `resource` block
  must be the exact PyPI sdist values (poet generates them). Flag any diff
  that changes a `url` without its paired `sha256` (or vice versa), or bumps
  a version inside a URL without touching the hash — that install fails, or
  worse, pins the wrong artifact.
- `Formula/gws-mcp.rb`: the version string appears five times — the
  `version` line plus four platform `url`s (release tag
  `fork/v<version>-mcp.<n>`, URL-encoded as `fork%2Fv...`). All five must
  agree, and each of the four `sha256`s is per-artifact. Flag any partial
  bump.
- A version bump that keeps the previous version's `bottle do` block is a
  real defect: stale bottles point at the old release tag and old binaries.
  The regeneration flow intentionally drops the bottle block on update;
  `bottle.yml` re-adds a fresh one after building. Don't ask for the old
  block to be preserved across a version bump.

## 2. Hand edits to generated formulae must be mirrored in the patch logic

`junos-ops.rb` / `mcp-stdio.rb` / `speedtest-z.rb` are regenerated from
scratch by `update-formula.yml` (poet output + the inline Python patch
script keyed on its `PACKAGE_META` dict: `desc`, `homepage`, `license`,
`depends_on` replacement, `test do` rewrite). A hand edit to one of those
formulae — say, a new `depends_on` — that isn't also added to `PACKAGE_META`
is silently reverted on the next upstream release; flag it. An example
already encoded there: `junos-ops` needs `depends_on "pkgconf" => :build`
because its `bcrypt` resource builds Rust
(`FormulaAudit/ResourceRequiresDependencies`).

Adding a new Python package touches four workflow places (per `CLAUDE.md`):
`PACKAGE_META`, the `repository_dispatch` `types` list, and the
`workflow_dispatch` choice options in `update-formula.yml`, plus the choice
options in `bottle.yml` — and also `sync-readme.yml`'s hardcoded `PACKAGES`
list if the package should appear in the README tables. Flag a new-package
PR that misses any of these.

## 3. Don't let a diff weaken the inline gates or the push logic

- The `Audit and style-check formula` steps in `update-formula.yml` and
  `bottle.yml` must stay between the local commit and the push. Because
  `lint.yml` never runs on these bot pushes (recursion guard), removing,
  reordering, or making these steps non-blocking means a malformed formula
  lands on `main` unchecked.
- The push steps have real bug history (PRs #2–#5): the rebase-retry loop
  absorbs concurrent pushes to `main` from sibling jobs (each job touches
  different files, so the rebase applies cleanly); `git push origin
  HEAD:main` is explicit because checkout leaves no upstream tracking ref;
  `update-formula.yml` embeds the token in the remote URL because
  `setup-homebrew` symlinks the repo into Homebrew's Taps directory, which
  breaks checkout's path-bound `includeIf` credentials; and
  `persist-credentials: true` is deliberate against checkout v5+'s changed
  default. Flag any change that reverts these to a bare `git push` or drops
  the retry loop — each element fixed an actual failure.
- The `pip install` and `poet` retry loops in `update-formula.yml` absorb
  PyPI CDN / JSON-API propagation lag right after an upstream release (the
  `repository_dispatch` fires within seconds of the PyPI upload). They are
  not dead code. Do check that changes keep the bounded attempt counts and
  the version guard (the `grep` for the expected sdist filename) that stops
  poet from silently regenerating the previous version.
- The `Open issue on failure` step dedups by exact issue title
  (`Formula auto-update failing: <pkg>`) — a title format change breaks the
  dedup and spams one issue per failed run.

## 4. Bottle conventions (`bottle.yml` and `bottle do` blocks)

- `brew bottle` writes `name--version` (double-dash) filenames, but Homebrew
  downloads `name-version` (single dash, `Bottle::Filename#url_encode`) —
  the publish job renames with `${f/--/-}` before `gh release upload`.
  Breaking that rename breaks every bottle install.
- `cellar` must be a Ruby symbol (`:any` / `:any_skip_relocation`);
  `brew bottle --json` emits the bare string `"any"`, so the patch script
  converts it.
- Repo conventions per `CLAUDE.md`: emit `rebuild N` only when > 0, sort
  `arm64_*` tags before others, and column-align the sha256 digests (the
  `BottleDigestIndentation` RuboCop cop enforces the alignment).
- Release tags are `<formula>-<version>`; the macOS matrix is currently
  `macos-14`/`macos-15` (arm64 only — GitHub's Intel runners are retired;
  Intel bottles are built locally per `CLAUDE.md`).

## 5. `gws-mcp` is a separate pipeline — don't fold it into the Python tooling

`Formula/gws-mcp.rb` is rewritten directly by the `gws-mcp` repository's
release workflow using a PAT (`HOMEBREW_TAP_TOKEN`), so unlike the
`GITHUB_TOKEN` bot pushes, those pushes *do* trigger `lint.yml`. It is
deliberately absent from `PACKAGE_META`, the `repository_dispatch` types,
and both workflows' choice lists — don't suggest adding it. The installed
binary is `gws`, not `gws-mcp`.

# Out of scope for review comments

- Style or naming nits that `brew style` and `brew audit --strict` don't
  flag — those two commands are this repo's entire style contract, and they
  run both in `lint.yml` and inline before every bot push.
- The long machine-generated `resource` lists in the Python formulae (20+
  blocks in `junos-ops.rb`/`speedtest-z.rb`): they mirror the PyPI dependency
  closure emitted by `homebrew-pypi-poet`. Don't propose trimming,
  re-pinning, or reformatting them by hand.
- Test depth: `test do` blocks are intentionally standardized to a
  `--version` smoke test by the patch script. Real test suites live in the
  upstream package repositories, not in this tap.
- MCP protocol concerns: `mcp-stdio` and `gws-mcp` are MCP tools upstream,
  but this repo only packages them — there is no MCP server code here, so
  stdio/JSON-RPC or MCP tool-design review guidance does not apply.
- Hand edits inside the `<!-- PACKAGES-TABLE-START -->` /
  `<!-- PACKAGES-TABLE-END -->` markers in `README.md` / `README.ja.md`:
  `sync-readme.yml` overwrites that block weekly from the source
  repositories' GitHub descriptions, so description fixes belong upstream.
  Edits outside the markers are fine. (`README.md` is English,
  `README.ja.md` is Japanese — per repo convention.)
- Dependabot coverage: `.github/dependabot.yml` intentionally covers only
  `github-actions`; formula version bumps are handled by this tap's own
  update workflows, not Dependabot.
