class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.9/gws-aarch64-apple-darwin.tar.gz"
      sha256 "2775ad2958a59618193260d761e091a4caad4fd2c52297e1a365dc14c984aeee"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.9/gws-x86_64-apple-darwin.tar.gz"
      sha256 "d545f2455383592d0fa4d39cbe9cd5f0440ce3d809d4c51c6ad855d40fe0f817"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.9/gws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94baf8d8504564a1572fb3dfbcaaee97fb459054eca67ddd19b78e501ee15eb2"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.9/gws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a06a7f2ab988c167d3882721dc62b369986906cef8e1357717d2e2c727a955f0"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
