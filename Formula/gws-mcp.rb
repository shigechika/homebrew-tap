class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.15/gws-mcp-0.22.5-mcp.15-macos-arm64.tar.gz"
      sha256 "d785f2d4dcb112b264929a4d5b2a1b2a5d900c4fb17c7683aef07492cac9328a"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.15/gws-mcp-0.22.5-mcp.15-macos-amd64.tar.gz"
      sha256 "ea6c8ddf4c14f51e62e0de199f0b672a096152db04b9bb832630840d908fff1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.15/gws-mcp-0.22.5-mcp.15-linux-arm64.tar.gz"
      sha256 "94e31f477e0dbe11585cb90005bb0754239c91b4dc30985b612bf8419a3d9442"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.15/gws-mcp-0.22.5-mcp.15-linux-amd64.tar.gz"
      sha256 "22a3a6c2b32ee7e5a1e7307fb0d5cd76a5b582bc920cb7445500511ed5cad3b6"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
