class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.24"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.24/gws-mcp-0.22.5-mcp.24-macos-arm64.tar.gz"
      sha256 "b0559643ec528221d2c9490f29e136f131b6ae6c36371a767d3d19b32053450c"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.24/gws-mcp-0.22.5-mcp.24-macos-amd64.tar.gz"
      sha256 "f982b0b655502a8d3502469f04d6a0f74ac26ce00b55e62f464e6e0f69c71ed0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.24/gws-mcp-0.22.5-mcp.24-linux-arm64.tar.gz"
      sha256 "97c5989ca1b096a77a2fbea899cff9f856cce2f0a3ee841e5b41f1c6bd344e17"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.24/gws-mcp-0.22.5-mcp.24-linux-amd64.tar.gz"
      sha256 "e320a8cfb06d32f375ea6098f81739591bb1f175a1c159d559acd883c19c255e"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
