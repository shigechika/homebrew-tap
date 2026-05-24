class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.23"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.23/gws-mcp-0.22.5-mcp.23-macos-arm64.tar.gz"
      sha256 "e8e0d10383aaafb730ca73026f6a82e35ebfaf6855f79d8bf0ad70cdd1076f4a"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.23/gws-mcp-0.22.5-mcp.23-macos-amd64.tar.gz"
      sha256 "9c1bb4168640e7bc18d007e6ebc4827d07cf64c455ea1be9737e43003f5b0dc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.23/gws-mcp-0.22.5-mcp.23-linux-arm64.tar.gz"
      sha256 "cb2c192317ef42d6b46ad750a95cf4e33d98fa1bfcf809b33111561da238b850"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.23/gws-mcp-0.22.5-mcp.23-linux-amd64.tar.gz"
      sha256 "fce09aa098f2d149b443c0a007c4a6be64c4739c8903fdb778bd77770e373e35"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
