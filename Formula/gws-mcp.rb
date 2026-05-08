class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.6/gws-aarch64-apple-darwin.tar.gz"
      sha256 "4869dac3176b8d6aae79463a78eccd2c0b10c714605a06ab7ff085f5e64dc4d4"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.6/gws-x86_64-apple-darwin.tar.gz"
      sha256 "595c3691f3c138bcdf612c3148272761adea62f167ef580724fda7685990526d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.6/gws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aaa91467e4d6e2f163d699d9f72794d56ec93c6a5c18dd6e6c444e02439edbda"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.6/gws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "644d390bc7acb214eefe5c9c06c6cf268c1845d0a2d60a742406205b265e8a94"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
