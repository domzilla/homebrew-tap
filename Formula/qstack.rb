class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "57d9fcc25835ba0f70120a50c7bd193a4c5b99cbfbfdb5d9cf6498e2ca71946e"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2441f445c6853b5e7c50ee7db68bb11721ce03071a94cc23668a113d6da52adb"
    sha256 cellar: :any_skip_relocation, sonoma: "2d88cc5e941642f9d24b8200fa393e700d5f6938a219a8b0a7358f1a17bddd82"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"qstack", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qstack --version")
  end
end
