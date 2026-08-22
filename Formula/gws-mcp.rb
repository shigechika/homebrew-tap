class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.31"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.31/gws-mcp-0.22.5-mcp.31-macos-arm64.tar.gz"
      sha256 "b4231678c5c600db214ad1e77808582acaf378817db8cf15e7a2e68a532bcc85"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.31/gws-mcp-0.22.5-mcp.31-macos-amd64.tar.gz"
      sha256 "ef64e53f7099d0af315fa4bdc4c96f2e2236f143d1982c5da11ee27efe5e5ad2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.31/gws-mcp-0.22.5-mcp.31-linux-arm64.tar.gz"
      sha256 "25ce71f7cf628265c2fe9f1acf40257a3d0061a9c90b6b8e7c3babc6faed1d53"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.31/gws-mcp-0.22.5-mcp.31-linux-amd64.tar.gz"
      sha256 "1bd0218e373813fb58a309526df0889c3ec3cee5995f692cf9d96683b655ea23"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
