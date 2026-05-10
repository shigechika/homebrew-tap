class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.18/gws-mcp-0.22.5-mcp.18-macos-arm64.tar.gz"
      sha256 "1a81b7e645c9e653cbde9e0d0e57640d06be2f78397f58b4efde875752b9f3c0"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.18/gws-mcp-0.22.5-mcp.18-macos-amd64.tar.gz"
      sha256 "f7f31092743a15019c84b9c06c7e81a5920e81adc61b994f0613e5a593f2831f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.18/gws-mcp-0.22.5-mcp.18-linux-arm64.tar.gz"
      sha256 "2042df3cd1f6d7cd73133625f7468ae23101257f1320e5b27a05a45c8cec3c57"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.18/gws-mcp-0.22.5-mcp.18-linux-amd64.tar.gz"
      sha256 "5f7501130f9aa08c0031b2a0e690c9b89e5168c6b8ff97970ad2be6343e62d1e"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
