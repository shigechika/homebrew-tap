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

`workflow_dispatch` による手動トリガーも可能。

### パッケージ追加・変更時の注意

- `resource` ブロックの URL と sha256 は PyPI のものを正確に使う
- `poet -f` の出力を元にパッチスクリプトが加工するため、Formula を手動で変更する場合はワークフロー内のパッチロジック（`PACKAGE_META` dict）との整合性を保つこと
- 新パッケージ追加時はワークフロー内の `PACKAGE_META`、`repository_dispatch` types、`workflow_dispatch` の choice options の3箇所を更新する

## 規約

- README.md は英語、README.ja.md は日本語で記述
- ライセンスは Apache-2.0
