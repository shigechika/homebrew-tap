class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.16/gws-mcp-0.22.5-mcp.16-macos-arm64.tar.gz"
      sha256 "d3e82e8e41e15db8054e6f40ea95eb509ae43748ab5da782a9370226f586ee63"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.16/gws-mcp-0.22.5-mcp.16-macos-amd64.tar.gz"
      sha256 "ad10f0ceb30bd15ff28e38889a529142c23d5678e440d5a5c6bbf4fdb0614112"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.16/gws-mcp-0.22.5-mcp.16-linux-arm64.tar.gz"
      sha256 "177ef5543b3cf648946c1a371eeca7b18ec55a3e83f4e5a237f833d23941cf47"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.16/gws-mcp-0.22.5-mcp.16-linux-amd64.tar.gz"
      sha256 "d2217dc42eb63d886f731ef76825835042f249960b2afd937b45dccea6345c8b"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
