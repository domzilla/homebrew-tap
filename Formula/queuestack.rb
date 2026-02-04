class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "887e025db37af32ce78bc2e9022f78d1b5402f8f7f7de10e547953688c58ac4b"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8fc5ca80a9b3c806b27b97754f4ef1e4ab46cb06871b5127f9a79bcdcade1f97"
    sha256 cellar: :any_skip_relocation, sonoma: "3dbb5d3c9bd07946d20e075654ab3a37d23f904abe8da460a5207da66b86dfd8"
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
