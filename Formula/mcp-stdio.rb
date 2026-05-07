class McpStdio < Formula
  include Language::Python::Virtualenv

  desc "Stdio-to-HTTP relay for MCP servers"
  homepage "https://github.com/shigechika/mcp-stdio"
  url "https://files.pythonhosted.org/packages/0f/10/a92ddaff5efad7e9fdcc695a96b7de16528eae04560426f49a7f487311ea/mcp_stdio-0.11.0.tar.gz"
  sha256 "f9e473a573aef8466ba0dc1da128b233feb3190f6010e52c660d5ad3cc59564a"
  license "MIT"

  bottle do
    root_url "https://github.com/shigechika/homebrew-tap/releases/download/mcp-stdio-0.11.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e79d7f96280ff7cfb3cdc2dd68de021f204aecf8129b84a1f304901990642f4c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4d908fc1ecdd2f3076eea5cde7e579df9fac82845bb2cc52951241115e2b7b4d"
  end

  depends_on "python@3.13"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13/anyio-4.13.0.tar.gz"
    sha256 "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a/certifi-2026.4.22.tar.gz"
    sha256 "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ce/cc/762dfb036166873f0059f3b7de4565e1b5bc3d6f28a414c13da27e442f99/idna-3.13.tar.gz"
    sha256 "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a91d4eef164a242"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_match "mcp-stdio", shell_output("#{bin}/mcp-stdio --version")
  end
end
