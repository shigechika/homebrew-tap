class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.10/gws-mcp-0.22.5-mcp.10-macos-arm64.tar.gz"
      sha256 "f50a21fe1ad368921f6ce381e5fb05b9d54691eef8b69faf4eec622115bf0de3"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.10/gws-mcp-0.22.5-mcp.10-macos-amd64.tar.gz"
      sha256 "35a6311eeb485944fe5223a806002af16f2bd371959a302090d6164bfe656792"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.10/gws-mcp-0.22.5-mcp.10-linux-arm64.tar.gz"
      sha256 "f802a07a8153f53a5bcbda58d484fb3fe6ae2fe856201dd6a643f3020618c16d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.10/gws-mcp-0.22.5-mcp.10-linux-amd64.tar.gz"
      sha256 "e36f2abfb1fe987706865edd443fbbac611e331fb5e59d28ed59d662ec97ff04"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
