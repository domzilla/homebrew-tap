class Clai < Formula
  desc "AI-powered shell command generator"
  homepage "https://github.com/domzilla/clai"
  url "https://github.com/domzilla/clai/archive/refs/tags/TAG_PLACEHOLDER.tar.gz"
  sha256 "SOURCE_SHA_PLACEHOLDER"
  license "MIT"
  head "https://github.com/domzilla/clai.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/clai/releases/download/TAG_PLACEHOLDER"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ARM64_SHA_PLACEHOLDER"
    sha256 cellar: :any_skip_relocation, sonoma: "X86_64_SHA_PLACEHOLDER"
  end

  depends_on "node" => :build

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clai --version")
  end
end
