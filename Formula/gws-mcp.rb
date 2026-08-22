class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.32"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.32/gws-mcp-0.22.5-mcp.32-macos-arm64.tar.gz"
      sha256 "846a1ab285197a6c8bb324a69c5ca2aac65e34e58b48c49d5e9a0097de58b88b"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.32/gws-mcp-0.22.5-mcp.32-macos-amd64.tar.gz"
      sha256 "c679c10188364ce0c80a37e59da413ddd6358cddac34b8b7857fb74ab837dd56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.32/gws-mcp-0.22.5-mcp.32-linux-arm64.tar.gz"
      sha256 "3553f8d8d96bd7fd2d6d0851a7d8e0efd2997565d0cdcfdb776786dfe3bba0cb"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.32/gws-mcp-0.22.5-mcp.32-linux-amd64.tar.gz"
      sha256 "53c3be74fb17b4916024b6746984a919a7300902d7f663443d45586f5e717b7a"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
