class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.20/gws-mcp-0.22.5-mcp.20-macos-arm64.tar.gz"
      sha256 "3c43cd09e23e303a2124917fa1b58c8885cec7498bee8c5c2e8a99f8c38c0062"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.20/gws-mcp-0.22.5-mcp.20-macos-amd64.tar.gz"
      sha256 "1441aec2a24407026e4dced89e47e99e37d8a3958ac9f4c32ca2ee87e272ec86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.20/gws-mcp-0.22.5-mcp.20-linux-arm64.tar.gz"
      sha256 "aaf647bd5142230bdb0865c9d622e5244183df557adc4c4f6dce15d930589281"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.20/gws-mcp-0.22.5-mcp.20-linux-amd64.tar.gz"
      sha256 "a76d491404ef9ebe9d084b736795846f9b980488e8fa223352482d7e8173ffc5"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
