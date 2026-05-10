class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.14/gws-mcp-0.22.5-mcp.14-macos-arm64.tar.gz"
      sha256 "68f5bdf4950286c4b100c6e5a9da636ee945799ec33df933c182e8441e9abf61"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.14/gws-mcp-0.22.5-mcp.14-macos-amd64.tar.gz"
      sha256 "ff85976e1626a88921a46d668512896702418dd9367edb95fad4479fc6a1dc99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.14/gws-mcp-0.22.5-mcp.14-linux-arm64.tar.gz"
      sha256 "f1b1ac13a4a31a7c39d9eebb57e810f448938903f6a07d1825c69d70d09b6994"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.14/gws-mcp-0.22.5-mcp.14-linux-amd64.tar.gz"
      sha256 "aec2cd4e7a2c98e81122f140b5b42cfc9bdfe849e0c8555d8d0bc9aec9f8b4f1"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
