class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8cddbbc2659fd225d79dca859c4fbd5641726495967fd9fd472c094677319141"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  # Bottles will be added by CI on next release
  # (v0.3.0 bottles were built with old binary name)

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"qs", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qs --version")
  end
end
