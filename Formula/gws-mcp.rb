class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-aarch64-apple-darwin.tar.gz"
      sha256 "cfea8139f11130eb0875524da38343dff749bbe2fae0ec2233b6cf5037e66e0d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-x86_64-apple-darwin.tar.gz"
      sha256 "fa1035b47afffc5dc2d1c4fc4d03affbef0f8b8a95dacb6b2e616a7f41d50dda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a1f7b0249f78c6fad37585ef52813f14bfa1194ded9f8ad1cfc3de7f88780a0"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.4/gws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69c0ef1e1a78714cf6c1e9484ca542290dd717e262609403da06ec9626a3146d"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
