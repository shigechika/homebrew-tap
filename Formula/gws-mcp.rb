class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.30"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.30/gws-mcp-0.22.5-mcp.30-macos-arm64.tar.gz"
      sha256 "9df725d99a4f16070aad8365dab90bae8484370a5406c6a412f2ecbcd6120316"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.30/gws-mcp-0.22.5-mcp.30-macos-amd64.tar.gz"
      sha256 "39b2c5b52cb07dcf782c2da3dbfe92e4f6760c2a6995bb90fcf414809e9a0db4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.30/gws-mcp-0.22.5-mcp.30-linux-arm64.tar.gz"
      sha256 "6860d8e85396876a55b93fa034ad9e052d96e970b2b55d1c6ce1f4eb37dfffaa"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.30/gws-mcp-0.22.5-mcp.30-linux-amd64.tar.gz"
      sha256 "698998a9dab96f71c2755529167c26b04da21b358b3231ede7cd1f688bca4542"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
