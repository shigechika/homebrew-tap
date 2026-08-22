class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.33"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.33/gws-mcp-0.22.5-mcp.33-macos-arm64.tar.gz"
      sha256 "dad8bb08e0c9cea59ccad803e75cb3ad5e3f8d241372d4ebfc45cc7a020b25a1"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.33/gws-mcp-0.22.5-mcp.33-macos-amd64.tar.gz"
      sha256 "751a3160f280b576fa91151c8fc4d22e5884b38d504dab6c572296c40ceb7c30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.33/gws-mcp-0.22.5-mcp.33-linux-arm64.tar.gz"
      sha256 "01b2e3222af8c608e6f5ee9163a319d8c7458146c7204de837134615fa2c0b7b"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.33/gws-mcp-0.22.5-mcp.33-linux-amd64.tar.gz"
      sha256 "2dd1b45eee33e86bb5d7b12bac920d514b752d5f068b6fcc80ab9f3f84e4dcbf"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
