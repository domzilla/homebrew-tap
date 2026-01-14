class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2ff8405ce47724235bc19a2757a8db6168e3e96df0d6567841b4a50c6fd15762"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: ""
    sha256 cellar: :any_skip_relocation, sonoma: ""
  end

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
