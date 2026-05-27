class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.25"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.25/gws-mcp-0.22.5-mcp.25-macos-arm64.tar.gz"
      sha256 "c5aca698dd51d4be8cb2ce7efcdd1c9f960023828003abbeeaf3de4b6186fee6"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.25/gws-mcp-0.22.5-mcp.25-macos-amd64.tar.gz"
      sha256 "ea31ba76f2a0057127c5f41cb83ac0c93f68f6e6ca076832148d73c370cf43dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.25/gws-mcp-0.22.5-mcp.25-linux-arm64.tar.gz"
      sha256 "bcbc9741ffd9c156ff1db6fbf7cd6c8e0b8dd068c3bce0635caae2f83c6f23d0"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.25/gws-mcp-0.22.5-mcp.25-linux-amd64.tar.gz"
      sha256 "18ee084fea5bcf112f78470094f4116e253847640d0b400df10a2033118321e8"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
