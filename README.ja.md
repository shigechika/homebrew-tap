# homebrew-tap

[junos-ops](https://github.com/shigechika/junos-ops)、[mcp-stdio](https://github.com/shigechika/mcp-stdio)、[speedtest-z](https://github.com/shigechika/speedtest-z)、[gws-mcp](https://github.com/shigechika/gws-mcp) の Homebrew tap です。

[English](README.md)

## インストール

### tap を追加

```bash
brew tap shigechika/tap
```

### パッケージをインストール

```bash
brew install junos-ops
brew install mcp-stdio
brew install speedtest-z
brew install gws-mcp
```

tap を追加せずに直接インストールすることもできます:

```bash
brew install shigechika/tap/junos-ops
brew install shigechika/tap/mcp-stdio
brew install shigechika/tap/speedtest-z
brew install shigechika/tap/gws-mcp
```

## パッケージ一覧

<!-- PACKAGES-TABLE-START -->
| パッケージ | 説明 | ソース |
|-----------|------|--------|
| [junos-ops](https://pypi.org/project/junos-ops/) | Python CLI to automate Juniper/JUNOS operations over NETCONF: model-aware upgrade, rollback, reboot, config push, and RSI/SCF collection | [GitHub](https://github.com/shigechika/junos-ops) |
| [mcp-stdio](https://pypi.org/project/mcp-stdio/) | Stdio-to-HTTP gateway — connects MCP clients to remote HTTP MCP servers | [GitHub](https://github.com/shigechika/mcp-stdio) |
| [speedtest-z](https://pypi.org/project/speedtest-z/) | Automated multi-site speed test runner with Selenium and Zabbix/Grafana/OTEL integration | [GitHub](https://github.com/shigechika/speedtest-z) |
| [gws-mcp](https://github.com/shigechika/gws-mcp) | MCP fork of Google Workspace CLI — exposes Drive, Gmail, Calendar, Sheets, Docs, Chat, Admin, and more to AI assistants. Dynamically built from Google Discovery Service. Includes AI agent skills. | [GitHub](https://github.com/shigechika/gws-mcp) |
<!-- PACKAGES-TABLE-END -->

## 自動更新

各ソースリポジトリで新しいバージョンが PyPI にリリースされると、`repository_dispatch` イベントがこの tap に送信され、[homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet) を使って Formula が自動的に再生成されます。

`gws-mcp` の Formula は、タグリリース時に gws-mcp 側の [release workflow](https://github.com/shigechika/gws-mcp/blob/main/.github/workflows/release.yml) が直接更新します。

このREADMEのパッケージ説明は `.github/workflows/sync-readme.yml` によって GitHub リポジトリの description と自動的に同期されます。

## License

[Apache License 2.0](LICENSE)
