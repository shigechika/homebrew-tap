# homebrew-tap

Homebrew tap for [junos-ops](https://github.com/shigechika/junos-ops), [mcp-stdio](https://github.com/shigechika/mcp-stdio), [speedtest-z](https://github.com/shigechika/speedtest-z), and [gws-mcp](https://github.com/shigechika/gws-mcp).

[Japanese / 日本語](README.ja.md)

## Installation

### Add the tap

```bash
brew tap shigechika/tap
```

### Install packages

```bash
brew install junos-ops
brew install mcp-stdio
brew install speedtest-z
brew install gws-mcp
```

Or install directly without adding the tap first:

```bash
brew install shigechika/tap/junos-ops
brew install shigechika/tap/mcp-stdio
brew install shigechika/tap/speedtest-z
brew install shigechika/tap/gws-mcp
```

## Packages

<!-- PACKAGES-TABLE-START -->
| Package | Description | Source |
|---------|-------------|--------|
| [junos-ops](https://pypi.org/project/junos-ops/) | Python CLI to automate Juniper/JUNOS operations over NETCONF: model-aware upgrade, rollback, reboot, config push, and RSI/SCF collection | [GitHub](https://github.com/shigechika/junos-ops) |
| [mcp-stdio](https://pypi.org/project/mcp-stdio/) | Bidirectional stdio ↔ HTTP gateway for MCP servers — connect clients to remote servers or publish local servers | [GitHub](https://github.com/shigechika/mcp-stdio) |
| [speedtest-z](https://pypi.org/project/speedtest-z/) | Automated multi-site speed test runner with Selenium and Zabbix/Grafana/OTEL integration | [GitHub](https://github.com/shigechika/speedtest-z) |
| [gws-mcp](https://github.com/shigechika/gws-mcp) | MCP fork of Google Workspace CLI — exposes Drive, Gmail, Calendar, Sheets, Docs, Chat, Admin, and more to AI assistants. Dynamically built from Google Discovery Service. Includes AI agent skills. | [GitHub](https://github.com/shigechika/gws-mcp) |
<!-- PACKAGES-TABLE-END -->

## Auto-update

Formulas are automatically updated when a new version is released on PyPI. Each source repository triggers a `repository_dispatch` event to this tap, which regenerates the formula using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

The `gws-mcp` formula is updated directly by its own [release workflow](https://github.com/shigechika/gws-mcp/blob/main/.github/workflows/release.yml) on each tagged release.

Package descriptions in this README are kept in sync with GitHub repository descriptions by `.github/workflows/sync-readme.yml`.

## License

[Apache License 2.0](LICENSE)
