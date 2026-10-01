class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.38"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.38/gws-mcp-0.22.5-mcp.38-macos-arm64.tar.gz"
      sha256 "0ef030824efeacc85d37c9574569440840b2a9b411a6dc9f7746d3d80693629e"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.38/gws-mcp-0.22.5-mcp.38-macos-amd64.tar.gz"
      sha256 "307d0aac4f3f340afa4f11cd55e408b38929a9049630f4f32158be89d3fc7d64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.38/gws-mcp-0.22.5-mcp.38-linux-arm64.tar.gz"
      sha256 "64db88366fe0e5b5d88c3558a4bd8b7049af59cd084b1fdc92b26269f9588afd"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.38/gws-mcp-0.22.5-mcp.38-linux-amd64.tar.gz"
      sha256 "551e0a85fd994a218d9f058b5c5fa7f5b9ab2249bbb3da97b45e800ee8db7361"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
