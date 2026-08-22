class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.34"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.34/gws-mcp-0.22.5-mcp.34-macos-arm64.tar.gz"
      sha256 "fd080d5b6a6fb600bc3bbd810849bb9028b96c438da5593e979b2a533bd968b8"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.34/gws-mcp-0.22.5-mcp.34-macos-amd64.tar.gz"
      sha256 "88cb70029782074c377987c99f74e8830f25ab9516914e56690b6880d074e4e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.34/gws-mcp-0.22.5-mcp.34-linux-arm64.tar.gz"
      sha256 "796e54bb0edf9b5b40ef5eae7c2463476f84193ae3f111bbeb9279153a880f3f"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.34/gws-mcp-0.22.5-mcp.34-linux-amd64.tar.gz"
      sha256 "44021d3c01b78530081d632ccf39302731a34793f4ddd0041a1cffb23daa5783"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
