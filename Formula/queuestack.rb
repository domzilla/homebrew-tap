class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f7e6efedead6310fa29c12ce8320f5e593007e588bdbda4ffe41c63f90805bfd"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7dcc216f49d44acd216fbed2cf60d32054fde02b786fe9b2859e806841df56ef"
    sha256 cellar: :any_skip_relocation, sonoma: "46d0bcb9bdee1c03ce1d05585fcf9887630a1e780f9ae240397aa60e6b52432d"
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
