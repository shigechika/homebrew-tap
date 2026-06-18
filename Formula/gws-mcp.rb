class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.27"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.27/gws-mcp-0.22.5-mcp.27-macos-arm64.tar.gz"
      sha256 "a525ecfce6f2a87cced3d1a4fde2596d7479cfd500a2ec3bbc5f5822842af278"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.27/gws-mcp-0.22.5-mcp.27-macos-amd64.tar.gz"
      sha256 "ab162aba92dac41bde669c092b6c441e20e9c31044957166549338f695ce89b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.27/gws-mcp-0.22.5-mcp.27-linux-arm64.tar.gz"
      sha256 "a2f2ac33fa66168915e98eee4f49a116a719503fa70676e88a49637989d98d2a"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.27/gws-mcp-0.22.5-mcp.27-linux-amd64.tar.gz"
      sha256 "55271c627231e30af59617c7b63546ecfa33f36883d01925d6d9751eac94086c"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
