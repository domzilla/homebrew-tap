class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "97c15d71f6fb0f64d1323cbdeb0defc58ff16cfee894314e034669b22c64f466"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "91c13439f6f6bcaa75b077300a913198c07dc878d4c5f2af1be24d1aecf88cf3"
    sha256 cellar: :any_skip_relocation, sonoma: "870b7f0cbf16ec227fef881d79cf460e0bbae49c48c9c6792d60f19ef228ffb4"
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
