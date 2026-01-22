class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "9b30809bb0fbeea32458104af1750e78fb9edd9b69b08aedbef24ca682931ca8"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ad8bea911f9207cdd00da5d3420a3abd9eeae7266a409bd8b939a9dbfb1adcbd"
    sha256 cellar: :any_skip_relocation, sonoma: "1d60b5f1b7bf7105094efd1467d4f6c29fd01469e3819251d3ff119e62825d3f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"qs", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qs --version")
  end
end
