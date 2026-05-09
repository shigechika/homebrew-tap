class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.13/gws-mcp-0.22.5-mcp.13-macos-arm64.tar.gz"
      sha256 "5721b65796e2ef96309ce2c01fb17bc2e972a2ab46f1168275c2116b1574f362"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.13/gws-mcp-0.22.5-mcp.13-macos-amd64.tar.gz"
      sha256 "e271eb6c33ac0a10b8a6cbc20a83f00ca18dcd568f7e0ac31956244ce1b2445b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.13/gws-mcp-0.22.5-mcp.13-linux-arm64.tar.gz"
      sha256 "87ee79b7ad7cb5216c6fb26b8e8effeb19ec63c8f6a30159ea36324c257983b1"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.13/gws-mcp-0.22.5-mcp.13-linux-amd64.tar.gz"
      sha256 "e1214e9f248b956556b3ecdf1dd55b1f171e3a3aa26aa279b252bd7fa0f637c0"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
