class JunosOps < Formula
  include Language::Python::Virtualenv

  desc "Automated JUNOS package update tool for Juniper devices"
  homepage "https://github.com/shigechika/junos-ops"
  url "https://files.pythonhosted.org/packages/eb/55/e966f1632f54cc928634018c9e573bf03cd35cecd03a1410113cceac15f9/junos_ops-0.11.2.tar.gz"
  sha256 "9c0eb0705453d1c7decf84cedbee1d39472b592966de044d8b8756cbbf38e4b4"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/shigechika/homebrew-tap/releases/download/junos-ops-0.11.2"
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "c20f2cdec2883b293f8146ed13c27d0c2c1a4de29abc90deaaaaa68c46e773a0"
    sha256 cellar: :any, arm64_sonoma:  "00eed9ffab17ffc8ad9bbd8dc3991fb4b07b0f762483ab5802b8990c14406261"
    sha256 cellar: :any, tahoe:         "3d0aa31c0a96ca4cffccab18524ae08792d3f8493e3c9f609a8cceb2a17bc32f"
  end

  depends_on "rust" => :build
  depends_on "libffi"
  depends_on "libsodium"
  depends_on "openssl@3"
  depends_on "python@3.13"

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "bcrypt" do
    url "https://files.pythonhosted.org/packages/d4/36/3329e2518d70ad8e2e5817d5a4cac6bba05a47767ec416c7d020a965f408/bcrypt-5.0.0.tar.gz"
    sha256 "f748f7c2d6fd375cc93d3fba7ef4a9e3a092421b8dbf34d8d4dc06be9492dfdd"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/60/04/ee2a9e8542e4fa2773b81771ff8349ff19cdd56b7258a0cc442639052edb/cryptography-46.0.5.tar.gz"
    sha256 "abace499247268e3757271b2f1e244b36b06f8515cf27c4d49468fc9eb16e93d"
  end

  resource "invoke" do
    url "https://files.pythonhosted.org/packages/de/bd/b461d3424a24c80490313fd77feeb666ca4f6a28c7e72713e3d9095719b4/invoke-2.2.1.tar.gz"
    sha256 "515bf49b4a48932b79b024590348da22f39c4942dff991ad1fb8b8baea1be707"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  resource "junos-eznc" do
    url "https://files.pythonhosted.org/packages/d4/2e/fbfb53be4adc17dedf7cec47007db898372d5b20d18068ef22b94bbb76e9/junos_eznc-2.7.6.tar.gz"
    sha256 "c4187fc2879c92939102799d7231c33fd49dfa1c5bc5357683bab7a0bd891194"
  end

  resource "looseversion" do
    url "https://files.pythonhosted.org/packages/64/7e/f13dc08e0712cc2eac8e56c7909ce2ac280dbffef2ffd87bd5277ce9d58b/looseversion-1.3.0.tar.gz"
    sha256 "ebde65f3f6bb9531a81016c6fef3eb95a61181adc47b7f949e9c0ea47911669e"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb/lxml-6.0.2.tar.gz"
    sha256 "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "ncclient" do
    url "https://files.pythonhosted.org/packages/c2/fb/29dbb4987f81d7932d8018079bf3e6d1d5cce320d7c2c90e84d3c7dba40c/ncclient-0.7.0.tar.gz"
    sha256 "318e8e3e72b1d2a766f3665cabef33436fd25b607da5f15657a199c648a68435"
  end

  resource "paramiko" do
    url "https://files.pythonhosted.org/packages/1f/e7/81fdcbc7f190cdb058cffc9431587eb289833bdd633e2002455ca9bb13d4/paramiko-4.0.0.tar.gz"
    sha256 "6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "PyNaCl" do
    url "https://files.pythonhosted.org/packages/d9/9a/4019b524b03a13438637b11538c82781a5eda427394380381af8f04f467a/pynacl-1.6.2.tar.gz"
    sha256 "018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bcf018f1ed8436811c"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/f3/91/9c6ee907786a473bf81c5f53cf703ba0957b23ab84c264080fb5a450416f/pyparsing-3.3.2.tar.gz"
    sha256 "c777f4d763f140633dcb6d8a3eda953bf7a214dc4eff598413c070bcdc117cbc"
  end

  resource "pyserial" do
    url "https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz"
    sha256 "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "scp" do
    url "https://files.pythonhosted.org/packages/d6/1c/d213e1c6651d0bd37636b21b1ba9b895f276e8057f882c9f944931e4f002/scp-0.15.0.tar.gz"
    sha256 "f1b22e9932123ccf17eebf19e0953c6e9148f589f93d91b872941a696305c83f"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/94/e7/b2c673351809dca68a0e064b6af791aa332cf192da575fd474ed7d6f16a2/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  resource "transitions" do
    url "https://files.pythonhosted.org/packages/4f/83/9e90f3494057d73c9e6bd8de8488af7c9fa714666ccc2db30fe07d147818/transitions-0.9.3.tar.gz"
    sha256 "881fb75bb1654ed55d86060bb067f2c716f8e155f57bb73fd444e53713aafec8"
  end

  resource "yamlloader" do
    url "https://files.pythonhosted.org/packages/e7/e6/81677e777ca8a3588012f74e215050e3001e39d253076beb1c3306fc9460/yamlloader-1.6.0.tar.gz"
    sha256 "918232976c9910d079ef74b3266ff9ef674228609aa56e67718b3992940a823f"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_match "junos-ops", shell_output("#{bin}/junos-ops --version")
  end
end
