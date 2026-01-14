class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"qstack", "completions")
  end

  test do
    system bin/"qstack", "--version"
    system bin/"qstack", "init"
  end
end
