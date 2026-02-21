# homebrew-tap

Homebrew tap for [junos-ops](https://github.com/shigechika/junos-ops) and [speedtest-z](https://github.com/shigechika/speedtest-z).

[Japanese / 日本語](README.ja.md)

## Installation

### Add the tap

```bash
brew tap shigechika/tap
```

### Install packages

```bash
brew install junos-ops
brew install speedtest-z
```

Or install directly without adding the tap first:

```bash
brew install shigechika/tap/junos-ops
brew install shigechika/tap/speedtest-z
```

## Packages

| Package | Description | Source |
|---------|-------------|--------|
| [junos-ops](https://pypi.org/project/junos-ops/) | Automated JUNOS package update tool for Juniper devices | [GitHub](https://github.com/shigechika/junos-ops) |
| [speedtest-z](https://pypi.org/project/speedtest-z/) | Automated speed test across 8 major sites with Zabbix integration | [GitHub](https://github.com/shigechika/speedtest-z) |

## Auto-update

Formulas are automatically updated when a new version is released on PyPI. Each source repository triggers a `repository_dispatch` event to this tap, which regenerates the formula using [homebrew-pypi-poet](https://github.com/tdsmith/homebrew-pypi-poet).

## License

[Apache License 2.0](LICENSE)
