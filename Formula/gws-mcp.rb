class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  url "https://github.com/shigechika/gws-mcp/archive/refs/tags/fork%2Fv0.22.5-mcp.2.tar.gz"
  version "0.22.5-mcp.2"
  sha256 "941d0c3d16547a2f9fef69241835f0c60405c473a2dbdc83494d7eab0b4a376a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/google-workspace-cli")
  end

  test do
    assert_match "gws", shell_output("#{bin}/gws --version")
  end
end
