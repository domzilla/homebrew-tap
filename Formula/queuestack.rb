class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "7d39b3705d2dd2b6cb684fc0454a338783d8c731945e986ef2f3f03f0e03e269"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3c4697ef2bd96e968fec260f756d978743369513bf114a83b061604d2902e113"
    sha256 cellar: :any_skip_relocation, sonoma: "ea5545267a298ae75339519cfe397351b605ddb6887863c753d70bca952db4fd"
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
