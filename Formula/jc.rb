class Jc < Formula
  include Language::Python::Virtualenv

  desc "Serializes the output of command-line tools to structured JSON output"
  homepage "https://github.com/kellyjonbrazil/jc"
  url "https://files.pythonhosted.org/packages/e3/b9/7878a4f71c873c7d67f39615086f1c8315740534b25eddc1a4f75f314832/jc-1.13.4.tar.gz"
  sha256 "45480ac3d399f70b57d8cc97a6795ea875a19863c55a56eae596c6e67303c5b8"
  license "MIT"
  revision 1

  livecheck do
    url :stable
  end

  bottle do
    cellar :any_skip_relocation
    sha256 "ff41c2b25d668eb53b205f2647d21d80ab5937c89fccc17d792adbf1c43666da" => :big_sur
    sha256 "48882549e16ca4736e5571ea0d84e2a6adef1b1cef6a7116eb4691b95abaca0c" => :arm64_big_sur
    sha256 "313688f0f20b532ca13557cfc17646733742138f140b17453c7485a32f1f2048" => :catalina
    sha256 "fe818b492817a0d857121ca5170ce693c141c796d4c4fd7b99f172fe5077a5ae" => :mojave
    sha256 "bd3fe1005d4773d72ce992685c86fbe5114d3660638c26bb024fc0be45aec0e7" => :high_sierra
  end

  depends_on "python@3.9"

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/6e/4d/4d2fe93a35dfba417311a4ff627489a947b01dc0cc377a3673c00cf7e4b2/Pygments-2.6.1.tar.gz"
    sha256 "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/16/8b/54a26c1031595e5edd0e616028b922d78d8ffba8bc775f0a4faeada846cc/ruamel.yaml-0.16.10.tar.gz"
    sha256 "099c644a778bf72ffa00524f78dd0b6476bca94a1da344130f4bf3381ce5b954"
  end

  resource "ruamel.yaml.clib" do
    url "https://files.pythonhosted.org/packages/92/28/612085de3fae9f82d62d80255d9f4cf05b1b341db1e180adcf28c1bf748d/ruamel.yaml.clib-0.2.0.tar.gz"
    sha256 "b66832ea8077d9b3f6e311c4a53d06273db5dc2db6e8a908550f3c14d67e718c"
  end

  resource "xmltodict" do
    url "https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49/xmltodict-0.12.0.tar.gz"
    sha256 "50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_equal "[{\"header1\": \"data1\", \"header2\": \"data2\"}]\n", \
                  pipe_output("#{bin}/jc --csv", "header1, header2\n data1, data2")
  end
end
