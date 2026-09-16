class Cowbell < Formula
  include Language::Python::Virtualenv

  desc "Pick an agent for this directory: running, resume, or new"
  homepage "https://pypi.org/project/cowbell/"
  url "https://files.pythonhosted.org/packages/e8/73/a31062655d6102076e80f2b7181d85304209da665eed023ad87470b7402f/cowbell-0.3.0.tar.gz"
  sha256 "aba7a2535f7b8e05c809b73cfe5c118be775acdb1f7fb47c9d24f8a0187e374b"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
    pkgshare.install_symlink libexec/"share/cowbell/harnesses.toml"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cowbell --version")
    assert_match "cowbell", shell_output("#{bin}/cowbell --help")
    assert_path_exists libexec/"share/cowbell/harnesses.toml"
  end
end
