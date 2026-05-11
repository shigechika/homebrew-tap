class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.19/gws-mcp-0.22.5-mcp.19-macos-arm64.tar.gz"
      sha256 "671a4e2a3a1a2ed340146ca3a3355d8f42dcaa2afe66e2749318bdf78b8e662b"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.19/gws-mcp-0.22.5-mcp.19-macos-amd64.tar.gz"
      sha256 "6f46cfee1c895a957b5f929d80ddc1f626108bf13250c40fa8ecfa3c148a1da4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.19/gws-mcp-0.22.5-mcp.19-linux-arm64.tar.gz"
      sha256 "3e8304c80a1d78acf5764ecbad45b7c70b3534b27f222a321c022318f4af3cb2"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.19/gws-mcp-0.22.5-mcp.19-linux-amd64.tar.gz"
      sha256 "33e8ac8e7b36c66555a5b2bbb2e24cc852ec30805f0a323096a653c3df0cb663"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
