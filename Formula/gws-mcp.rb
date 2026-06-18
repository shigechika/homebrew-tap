class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.28"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.28/gws-mcp-0.22.5-mcp.28-macos-arm64.tar.gz"
      sha256 "1b60a0eda821b257eda66cf861b3c63e0edb12dc809fc6a3afc74a581eba6f37"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.28/gws-mcp-0.22.5-mcp.28-macos-amd64.tar.gz"
      sha256 "38467819067b88cfa7c9014f06bc39e1ab881308879a11aff8a7709503b70b54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.28/gws-mcp-0.22.5-mcp.28-linux-arm64.tar.gz"
      sha256 "7f8f0f6dba68a8b7c91010afe0def30f7ac2897de19647fe8064b59d2c4e15c2"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.28/gws-mcp-0.22.5-mcp.28-linux-amd64.tar.gz"
      sha256 "a647dc9837b7b52104d15d79221179335188599172ad818c68b0c77d06333c01"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
