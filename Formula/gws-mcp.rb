class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.29"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.29/gws-mcp-0.22.5-mcp.29-macos-arm64.tar.gz"
      sha256 "a5cb02b08d8279eeff35b1dc42a6cdfc459932f8ed938ddfcccb06900051de0d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.29/gws-mcp-0.22.5-mcp.29-macos-amd64.tar.gz"
      sha256 "36fa2591ebae2c9b428be68e507d4b67ef2c4c782f4293cbda05a28037017d59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.29/gws-mcp-0.22.5-mcp.29-linux-arm64.tar.gz"
      sha256 "e671556cb095129e984ccac37440622d81bf4276cbb0677e82d3804096385dac"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.29/gws-mcp-0.22.5-mcp.29-linux-amd64.tar.gz"
      sha256 "e8078ca63b387bcc0e6b8c7b87effb4623a086d144247c70dc1a905230a3a54b"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
