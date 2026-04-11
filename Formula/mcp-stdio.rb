class McpStdio < Formula
  include Language::Python::Virtualenv

  desc "Stdio-to-HTTP relay for MCP servers"
  homepage "https://github.com/shigechika/mcp-stdio"
  url "https://files.pythonhosted.org/packages/3e/a5/dbf41f1817ffea3e0aec5625410712a4099f1621ca2f04ba46d78b448288/mcp_stdio-0.3.4.tar.gz"
  sha256 "a776ca77ab60d41f342390a956019d175afa393c9067cbda04990faf39856d55"
  license "MIT"

  bottle do
    root_url "https://github.com/shigechika/homebrew-tap/releases/download/mcp-stdio-0.3.4"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1751aa944a40d6ec575c52bdedb53d73135c763c5f2ef0f8e13041140834a678"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f7d72b79c867653daabc6b34f41a7f6cf214a817e8d919f04e29606fb511be44"
  end

  depends_on "python@3.13"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13/anyio-4.13.0.tar.gz"
    sha256 "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/af/2d/7bf41579a8986e348fa033a31cdd0e4121114f6bce2457e8876010b092dd/certifi-2026.2.25.tar.gz"
    sha256 "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
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
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_match "mcp-stdio", shell_output("#{bin}/mcp-stdio --version")
  end
end
