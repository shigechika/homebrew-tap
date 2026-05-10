class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.17/gws-mcp-0.22.5-mcp.17-macos-arm64.tar.gz"
      sha256 "4ec1c3bdb555be565f11be3164e149a9e2fc715b2c49ba9145c58c808c711eee"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.17/gws-mcp-0.22.5-mcp.17-macos-amd64.tar.gz"
      sha256 "64c3a3dd0602f427ad0ffa54cf64e655e319f2f64746e2d8076f737f12e91400"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.17/gws-mcp-0.22.5-mcp.17-linux-arm64.tar.gz"
      sha256 "a12322a84360f99421e539ed40495626b8381cc063ac9ed1b696de5ecb680f8e"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.17/gws-mcp-0.22.5-mcp.17-linux-amd64.tar.gz"
      sha256 "5bcca8ff2cadddf229a0ff839c7143b0ebc41a98be0305a4485c52de3293edc9"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
