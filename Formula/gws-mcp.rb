class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.12/gws-mcp-0.22.5-mcp.12-macos-arm64.tar.gz"
      sha256 "7796be1208e06b452c51f63e896c12c46976adf4b9466d5feff223296f52f87b"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.12/gws-mcp-0.22.5-mcp.12-macos-amd64.tar.gz"
      sha256 "dbc7ec24935ddc1273a17096dc580edbbe86509fc23d4717cbfc3d2c28d3ae9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.12/gws-mcp-0.22.5-mcp.12-linux-arm64.tar.gz"
      sha256 "4450801f9f8caca5a3ae8d2e8d152fb5e819e17a234dd953f8979cd312f4a123"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.12/gws-mcp-0.22.5-mcp.12-linux-amd64.tar.gz"
      sha256 "70f71982322a70529c7794a0ef7b25166b7ba8d07fcb4218e4b3c956410b3ac9"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
