class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.11/gws-mcp-0.22.5-mcp.11-macos-arm64.tar.gz"
      sha256 "4326406a718bc0684d1f62360010b243b88d5f1ef4b2de24d1758adf1e2d803d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.11/gws-mcp-0.22.5-mcp.11-macos-amd64.tar.gz"
      sha256 "2b76c9fea8a735503686c9d15329d652bf967c0b9adfeb6e1e8e2613c2d9d393"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.11/gws-mcp-0.22.5-mcp.11-linux-arm64.tar.gz"
      sha256 "8d89db7c43d25bc916f1723a152c93607554d6e505d180bb81e07a55a2fbcc3d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.11/gws-mcp-0.22.5-mcp.11-linux-amd64.tar.gz"
      sha256 "c9f5f3cbc1534b931de92d2209681a396ccee8d77835fa6a71614ebf4dd329ec"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
