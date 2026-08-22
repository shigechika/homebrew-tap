class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.35"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.35/gws-mcp-0.22.5-mcp.35-macos-arm64.tar.gz"
      sha256 "1955a226542e5d9b184d1e84202daede37657d8d3a1352251cc5ca0fb158cf73"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.35/gws-mcp-0.22.5-mcp.35-macos-amd64.tar.gz"
      sha256 "1a2bf0a306cb9814017610b96912c0e8fc3d67159b3f252b5086af9888fdd938"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.35/gws-mcp-0.22.5-mcp.35-linux-arm64.tar.gz"
      sha256 "62d4d2f0e74de4c22a8b2b3c4fd2331e47033ca8d5db990df263075480a06016"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.35/gws-mcp-0.22.5-mcp.35-linux-amd64.tar.gz"
      sha256 "45b5bedbde70b993838f09e6998006795a94593df4c13b2c6f8cfd6ca62f2d18"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
