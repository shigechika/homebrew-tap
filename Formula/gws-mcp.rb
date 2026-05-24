class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.22"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.22/gws-mcp-0.22.5-mcp.22-macos-arm64.tar.gz"
      sha256 "0df19eff35a06b8fa0c6e597585918aa6f9507f7e0a7c3c0694360ccadb51c43"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.22/gws-mcp-0.22.5-mcp.22-macos-amd64.tar.gz"
      sha256 "1d5e33d9f681af2a81fde7ef3495c87b0b80b8f6f2cc9ed469c1ed2c44cc1e71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.22/gws-mcp-0.22.5-mcp.22-linux-arm64.tar.gz"
      sha256 "8813090f000dba69138dfb0f8b248865a2fa5e4e4a1919d8c3bb6b16a408e971"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.22/gws-mcp-0.22.5-mcp.22-linux-amd64.tar.gz"
      sha256 "12236c316adf12e437730bd9d636b0a052bfe7bf16da7a5d08ce31cc13697c35"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
