# homebrew-tap

[junos-ops](https://github.com/shigechika/junos-ops) と [speedtest-z](https://github.com/shigechika/speedtest-z) の Homebrew tap です。

[English](README.md)

## インストール

### tap を追加

```bash
brew tap shigechika/tap
```

### パッケージをインストール

```bash
brew install junos-ops
brew install speedtest-z
```

tap を追加せずに直接インストールすることもできます:

```bash
brew install shigechika/tap/junos-ops
brew install shigechika/tap/speedtest-z
```

## パッケージ一覧

| パッケージ | 説明 | ソース |
|-----------|------|--------|
| [junos-ops](https://pypi.org/project/junos-ops/) | Juniper デバイスの JUNOS パッケージ自動更新ツール | [GitHub](https://github.com/shigechika/junos-ops) |
| [speedtest-z](https://pypi.org/project/speedtest-z/) | 8つの速度テストサイトを自動巡回する計測ツール（Zabbix 連携） | [GitHub](https://github.com/shigechika/speedtest-z) |

## 自動更新

各ソースリポジトリで新しいバージョンが PyPI にリリースされると、`repository_dispatch` イベントがこの tap に送信され、[homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet) を使って Formula が自動的に再生成されます。

## License

[Apache License 2.0](LICENSE)
