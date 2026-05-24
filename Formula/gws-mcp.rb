class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.21/gws-mcp-0.22.5-mcp.21-macos-arm64.tar.gz"
      sha256 "58d161756d4e1cfa2a62976f74954b9f903f9d5b464bfef3e311254097d8c902"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.21/gws-mcp-0.22.5-mcp.21-macos-amd64.tar.gz"
      sha256 "141f69466b07758fac191662c14d9ae2e8d4dedbda62d081cf3ed9e133b3123d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.21/gws-mcp-0.22.5-mcp.21-linux-arm64.tar.gz"
      sha256 "46bb6f8ac8e5b29621575643b5ecb287fcaf4d2cc252d57e6365dbe6255711a8"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.21/gws-mcp-0.22.5-mcp.21-linux-amd64.tar.gz"
      sha256 "4127d07799d364c637a82f04ecb204f908934a296c614731a7e0546a6d860759"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
