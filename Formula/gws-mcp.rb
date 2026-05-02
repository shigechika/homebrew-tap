class GwsMcp < Formula
  desc "Google Workspace CLI with MCP server support"
  homepage "https://github.com/shigechika/gws-mcp"
  version "0.22.5-mcp.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.5/gws-aarch64-apple-darwin.tar.gz"
      sha256 "b6f44c248e42cb62236eb1291c0a8e4fc7419ca0cbc8dd24eda53f0c932c7a93"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.5/gws-x86_64-apple-darwin.tar.gz"
      sha256 "4b215194da7f91570ae3e66901569fbb6ce59af9486aaded893770290302658e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.5/gws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85bc2960ba1cc8a011c7077b33957591a724f859cda74cbf84d69f4b513c7008"
    end
    on_intel do
      url "https://github.com/shigechika/gws-mcp/releases/download/fork%2Fv0.22.5-mcp.5/gws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "570b9b5bdba1dd0be5f98c84ee403921baf9e3518ecde9ff2a3ecab307bdd2f0"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gws --version")
  end
end
