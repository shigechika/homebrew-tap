class SpeedtestZ < Formula
  include Language::Python::Virtualenv

  desc "Automated speed test across 8 major sites with Zabbix integration"
  homepage "https://github.com/shigechika/speedtest-z"
  url "https://files.pythonhosted.org/packages/90/f9/f5c5df87fd70c5d903e413372d771d74be3bafc1f32b6a5be8ceddf226d9/speedtest_z-0.10.0.tar.gz"
  sha256 "c2af8b819ea4cc4160ab20884e93c05fa4c473a313620c762b7dba1e3e0ffb79"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on "libffi"
  depends_on "openssl@3"
  depends_on "python@3.13"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/9a/8e/82a0fe20a541c03148528be8cac2408564a6c9a0cc7e9171802bc1d26985/attrs-26.1.0.tar.gz"
    sha256 "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c985eff32"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/f3/ce/ee2ecad540810a79593028e88299baeae54d346cc7a0d94b6199988b89b1/certifi-2026.5.20.tar.gz"
    sha256 "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/1f/99/d1c90d6041656cc6ee229dc99cd67fd0cd5aec3c5f7d72fffc27cc750054/cryptography-49.0.0.tar.gz"
    sha256 "f89660a348f4f78a92366240a61404e337586ef7f5909a2fef59ca88ef505493"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/cd/63/9496c57188a2ee585e0f1db071d75089a11e98aa86eb99d9d7618fc1edce/idna-3.18.tar.gz"
    sha256 "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
  end

  resource "outcome" do
    url "https://files.pythonhosted.org/packages/98/df/77698abfac98571e65ffeb0c1fba8ffd692ab8458d617a0eed7d9a8d38f2/outcome-1.3.0.post0.tar.gz"
    sha256 "9dcf02e65f2971b80047b377468e72a268e15c0af3cf1238e6ff14f7f91143b8"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1b/7d/92392ff7815c21062bea51aa7b87d45576f649f16458d78b7cf94b9ab2e6/pycparser-3.0.tar.gz"
    sha256 "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
  end

  resource "pyOpenSSL" do
    url "https://files.pythonhosted.org/packages/74/b7/da07bae88f5a9506b4def6f2f4903cf4c3b8831e560dba8fa18ca08f758f/pyopenssl-26.3.0.tar.gz"
    sha256 "589de7fae1c9ea670d18422ed00fc04da787bbde8e1454aea872aa57b49ad341"
  end

  resource "pyopenssl-psk" do
    url "https://files.pythonhosted.org/packages/b7/b7/d180474eee89b39a44f8622db8a800d3292458e990cd06ac31d602f6cf1c/pyopenssl-psk-1.0.0.tar.gz"
    sha256 "411bdf469d85f9f3009662196bd2d103a01e3d972dcd7680b89fc950fa8c9500"
  end

  resource "PySocks" do
    url "https://files.pythonhosted.org/packages/bd/11/293dd436aea955d45fc4e8a35b6ae7270f5b8e00b53cf6c024c83b657a11/PySocks-1.7.1.tar.gz"
    sha256 "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
  end

  resource "selenium" do
    url "https://files.pythonhosted.org/packages/86/48/486aa67320f27452e9f551b8608f1a59ce7091c8fe7ebc9f4eba274775d4/selenium-4.45.0.tar.gz"
    sha256 "563f0c4102f112df1cda30d46ce6d177b2e4a7a3d4b0756902d5dc84d3a8a365"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/a2/87/a6771e1546d97e7e041b6ae58d80074f81b7d5121207425c964ddf5cfdbd/sniffio-1.3.1.tar.gz"
    sha256 "f4324edc670a0f49750a81b895f35c3adb843cca46f0530f79fc1babb23789dc"
  end

  resource "sortedcontainers" do
    url "https://files.pythonhosted.org/packages/e8/c4/ba2f8066cceb6f23394729afe52f3bf7adec04bf9ed2c820b39e19299111/sortedcontainers-2.4.0.tar.gz"
    sha256 "25caa5a06cc30b6b83d11423433f65d1f9d76c4c6a0c90e3379eaa43b9bfdb88"
  end

  resource "trio" do
    url "https://files.pythonhosted.org/packages/52/b6/c744031c6f89b18b3f5f4f7338603ab381d740a7f45938c4607b2302481f/trio-0.33.0.tar.gz"
    sha256 "a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970"
  end

  resource "trio-websocket" do
    url "https://files.pythonhosted.org/packages/d1/3c/8b4358e81f2f2cfe71b66a267f023a91db20a817b9425dd964873796980a/trio_websocket-0.12.2.tar.gz"
    sha256 "22c72c436f3d1e264d0910a3951934798dcc5b00ae56fc4ee079d46c7cf20fae"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953/urllib3-2.7.0.tar.gz"
    sha256 "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
  end

  resource "websocket-client" do
    url "https://files.pythonhosted.org/packages/2c/41/aa4bf9664e4cda14c3b39865b12251e8e7d239f4cd0e3cc1b6c2ccde25c1/websocket_client-1.9.0.tar.gz"
    sha256 "9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd1bc7e08a46ec98"
  end

  resource "wsproto" do
    url "https://files.pythonhosted.org/packages/c7/79/12135bdf8b9c9367b8701c2c19a14c913c120b882d50b014ca0d38083c2c/wsproto-1.3.2.tar.gz"
    sha256 "b86885dcf294e15204919950f666e06ffc6c7c114ca900b060d6e16293528294"
  end

  resource "zappix" do
    url "https://files.pythonhosted.org/packages/0e/3f/fed6b95e28b529825d9231aacd84cb4cc5b255ec272ee8aa1245a6065c9b/zappix-1.2.3.tar.gz"
    sha256 "c22b658f838dad5a7e059580470a425aac13b156350b51276ae6c69a5f864c1c"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    assert_match "speedtest-z", shell_output("#{bin}/speedtest-z --version")
  end
end
