class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.26"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.26/gws-mcp-0.22.5-mcp.26-macos-arm64.tar.gz"
      sha256 "e370bcf3e54f965bce64752ecbd4e044e403624cf4664651d1922d775526210c"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.26/gws-mcp-0.22.5-mcp.26-macos-amd64.tar.gz"
      sha256 "e527102f713966b51e174910948af8d1415dcdd6e13716becc0f2e88e3a9b6c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.26/gws-mcp-0.22.5-mcp.26-linux-arm64.tar.gz"
      sha256 "7c6b182199b9449cb8ba8aade971e2bb1fc07489b2d07209e9e40b4f2f9db00d"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.26/gws-mcp-0.22.5-mcp.26-linux-amd64.tar.gz"
      sha256 "6a3d03a188f238c8c3bfdceafc50b8839abc2f6b78663c10bea9ea7b5adf6d0e"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
