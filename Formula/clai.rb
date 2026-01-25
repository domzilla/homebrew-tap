class Clai < Formula
  desc "AI-powered shell command generator"
  homepage "https://github.com/domzilla/clai"
  url "https://github.com/domzilla/clai/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ba5d94b6408fe7aa9d6e99a27f16f19680732b2cbcea720ad02c5ffcc52eaa88"
  license "MIT"
  head "https://github.com/domzilla/clai.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/clai/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4a18b963d1a0fd1f91ccb27adaa35e1cd5bf85564ab38ae73debb8c6f9efe0bd"
    sha256 cellar: :any_skip_relocation, sonoma: "64c5f1976955496ffca4caaebedb2fceeabff56b2b6eeaa2c91b342437e50072"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clai --version")
  end
end
