class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "4f16c2158e20b809264fa238e6b78bc9334a4fb01a2893cd2fd2fde3a52dcc69"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1a8087e52fc54f541804991053ba3006e000598fff9b843478bb0321f04b0a07"
    sha256 cellar: :any_skip_relocation, sonoma: "5411f547237f88be793895a9eebf43d1a58dc7b83dd5e9671966278b0882bc3b"
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
