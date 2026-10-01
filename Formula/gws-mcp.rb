class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.37"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.37/gws-mcp-0.22.5-mcp.37-macos-arm64.tar.gz"
      sha256 "56f81c8d92f8baebba590cbc1dccf33863a2d39743de4fca115bced134ae0ac2"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.37/gws-mcp-0.22.5-mcp.37-macos-amd64.tar.gz"
      sha256 "89850bd31768151846a3f33509354ff10c35804e3574c3e61156999b0e9a6f86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.37/gws-mcp-0.22.5-mcp.37-linux-arm64.tar.gz"
      sha256 "5b33d03178367e6dd58f79d6e8edbd95995dd5e5542b7b3f4ebb5d3a7ea2c6eb"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.37/gws-mcp-0.22.5-mcp.37-linux-amd64.tar.gz"
      sha256 "31b535c98f7ad259047137ac69e46ca25bff7f6b9f2ad605ab27ba3ed82940c7"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
