class McpStdio < Formula
  include Language::Python::Virtualenv

  desc "Stdio-to-HTTP relay for MCP servers"
  homepage "https://github.com/shigechika/mcp-stdio"
  url "https://files.pythonhosted.org/packages/8d/22/f8885ead5616cae3f7152794472a84453be0a2b3e0c87620d17791c99c27/mcp_stdio-0.13.1.tar.gz"
  sha256 "e364959732f8c847e595d007d3505e44dac3f83e14fb1e7ec1c8bb6e949ea77f"
  license "MIT"

  bottle do
    root_url "https://github.com/shigechika/homebrew-tap/releases/download/mcp-stdio-0.13.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1015187f0d11639cae5cd4d1902a12b91a886c2ffa3b9423ea7c15635f39d7c8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cccaf335e000133f86e899c1460db5ace01037ed95f030d05fca0aaee756103a"
  end

  depends_on "python@3.13"

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13/anyio-4.13.0.tar.gz"
    sha256 "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/f3/ce/ee2ecad540810a79593028e88299baeae54d346cc7a0d94b6199988b89b1/certifi-2026.5.20.tar.gz"
    sha256 "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
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
    url "https://files.pythonhosted.org/packages/b9/28/99c51f664567218d824af024c0251650fb27e4ca066df188dab0769c5b91/idna-3.17.tar.gz"
    sha256 "5eb0cb53bc467c12eadcf6de83163ad8527cec9416f44b9b61b19caedad2b87f"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_match "mcp-stdio", shell_output("#{bin}/mcp-stdio --version")
  end
end
