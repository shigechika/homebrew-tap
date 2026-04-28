class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-aarch64-apple-darwin.tar.gz"
      sha256 "e9fe06b9311ff95a4fb2c04b308b1d99ee4626c03d1452afd642a817edf277f7"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-x86_64-apple-darwin.tar.gz"
      sha256 "f072ac17e2ffc430aba247ba7a6afe0f25d1a8cd3c89aa34fb6be58d88109567"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90d76481c5c083d85bb89a504a31afae41e76effce1f6d2a9f5c31c399fcea9d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80a47e568eddbc5d389a93b974b58aa2d29a85cc4a8f53c1eba4f6dc06baca12"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
