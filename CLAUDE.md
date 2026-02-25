# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

Homebrew tap (`shigechika/tap`)。自作の Python パッケージ群を Homebrew でインストールできるようにする Formula を管理している。現在収録しているパッケージは `Formula/` ディレクトリを参照。

## 開発コマンド

```bash
# tap をローカルからインストール（開発時）
brew install --build-from-source ./Formula/<package>.rb

# Formula の構文チェック
brew audit --strict --new Formula/<package>.rb

# Formula のスタイルチェック
brew style Formula/<package>.rb

# homebrew-pypi-poet で依存関係を含む Formula を再生成
pip install "setuptools<71" <package> homebrew-pypi-poet
poet -f <package> > /tmp/formula-raw.rb
```

## アーキテクチャ

### Formula 構成

`Formula/*.rb` は Ruby で記述された Homebrew Formula。全パッケージ共通で `Language::Python::Virtualenv` を使い、`virtualenv_install_with_resources` でインストールする。各 `resource` ブロックが PyPI 依存パッケージに対応する。

### 自動更新ワークフロー

`.github/workflows/update-formula.yml` が Formula の自動更新を担う:

1. ソースリポジトリが PyPI にリリースすると `repository_dispatch` イベントを送信
2. ワークフローが `homebrew-pypi-poet` で Formula を再生成（`poet -f <package>`）
3. Python スクリプトで生成された Formula にメタデータをパッチ適用:
   - `desc`, `homepage`, `license` の設定
   - `python3` 依存を実際の依存ブロック（`libffi`, `openssl@3` 等）に置換
   - `test do` ブロックを `--version` チェックに置換
4. 変更があれば自動コミット＆プッシュ
5. bottle ビルドワークフロー（`bottle.yml`）を自動トリガー

`workflow_dispatch` による手動トリガーも可能。

### Bottle ビルドワークフロー

`.github/workflows/bottle.yml` がプリビルドバイナリ（bottle）の作成・配布を担う:

1. `update-formula.yml` が Formula 更新後に `gh workflow run` で自動トリガー（`workflow_dispatch`）
2. macOS マトリクス（macos-14: arm64_sonoma, macos-15: arm64_sequoia）で `brew install --build-bottle` → `brew bottle --json` を実行
3. 生成された bottle を GitHub Releases にアップロード（タグ: `<formula>-<version>`）
4. bottle JSON から `bottle do ... end` ブロックを生成して Formula に追記・コミット

bottle があるプラットフォームでは `brew install/upgrade` 時にソースビルドが不要になり、数秒でインストールが完了する。

手動トリガー: `gh workflow run bottle.yml -f formula=<package>`

#### Bottle ファイル名の注意（url_encode 問題）

`brew bottle` が生成するファイル名はダブルダッシュ区切り（`name--version`、例: `junos-ops--0.11.2.tahoe.bottle.1.tar.gz`）だが、`brew install` がダウンロードする際の URL は `Bottle::Filename#url_encode` によりシングルダッシュ（`name-version`、例: `junos-ops-0.11.2.tahoe.bottle.1.tar.gz`）になる。GitHub Releases にアップロードする際は**シングルダッシュにリネーム**する必要がある。`bottle.yml` では `sed 's/--/-/'` でリネーム済み。

#### Bottle ブロックの記法

- cellar は Ruby シンボル（`:any`, `:any_skip_relocation`）を使用。`brew bottle --json` は `"any"` と出力するので `:any` に変換が必要
- `rebuild` が 0 より大きい場合は `rebuild N` 行を含める
- 複数タグがある場合、SHA256 ダイジェストの位置を揃える（`BottleDigestIndentation`）
- `arm64_` タグを先、その他を後にソート

#### Intel (x86_64) サポート

GitHub Actions の macOS Intel ランナー（macos-13）は廃止済み。Intel 向け bottle はローカルでビルドしてアップロードする:

```bash
brew uninstall <package>
brew install --build-bottle shigechika/tap/<package>
brew bottle --json --root-url="https://github.com/shigechika/homebrew-tap/releases/download/<package>-<version>" shigechika/tap/<package>
# シングルダッシュにリネームしてアップロード
mv <package>--<version>.<tag>.bottle.<rebuild>.tar.gz <package>-<version>.<tag>.bottle.<rebuild>.tar.gz
gh release upload <package>-<version> <package>-<version>.<tag>.bottle.<rebuild>.tar.gz --clobber
# Formula の bottle ブロックに sha256 行を追加
```

### CI lint ワークフロー

`.github/workflows/lint.yml` が Formula の品質チェックを担う:

- `push`（main）と `pull_request` でトリガー
- `Homebrew/actions/setup-homebrew@master` でリポジトリを tap として自動登録
- 全 Formula に `brew audit --strict` と `brew style` を実行
- `brew style` は tap 全体を対象とするため、ワークフロー YAML 内のシェルスクリプトにも shellcheck が適用される

### パッケージ追加・変更時の注意

- `resource` ブロックの URL と sha256 は PyPI のものを正確に使う
- `poet -f` の出力を元にパッチスクリプトが加工するため、Formula を手動で変更する場合はワークフロー内のパッチロジック（`PACKAGE_META` dict）との整合性を保つこと
- 新パッケージ追加時はワークフロー内の `PACKAGE_META`、`repository_dispatch` types、`workflow_dispatch` の choice options の3箇所を更新する。`bottle.yml` の `workflow_dispatch` choice options にも追加すること

## 規約

- README.md は英語、README.ja.md は日本語で記述
- ライセンスは Apache-2.0
