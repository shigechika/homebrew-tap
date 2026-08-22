class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.36"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.36/gws-mcp-0.22.5-mcp.36-macos-arm64.tar.gz"
      sha256 "10be589741d229945aa130af09e6d35e19817290ff7dd31694843dbb48edfa62"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.36/gws-mcp-0.22.5-mcp.36-macos-amd64.tar.gz"
      sha256 "4c81f61450308f224acaf8fce84cf6ec06d165d9924122d0902365f00482cc13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.36/gws-mcp-0.22.5-mcp.36-linux-arm64.tar.gz"
      sha256 "15791351b04c2da505eb6632f8b6d4ab61685c07e6fa78630166ade25edc3b67"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.36/gws-mcp-0.22.5-mcp.36-linux-amd64.tar.gz"
      sha256 "588c46e673794258faf9b0b1d3926e6b7e99f9eacfcf50beb988c05c714c6dd4"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
