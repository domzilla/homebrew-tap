class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "53678716ed581e74ce0f092f4b3478622cac96658fedfc21115ea8c7ab8f6d72"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e7ce5cba0e0023a61f399ffdf4c97c1d29e4a3820c9f8cf047724dcd8aa4ea22"
    sha256 cellar: :any_skip_relocation, sonoma: "e2cdcf31410b0eea70734f3038dd1ad9ead766bad0d9ae925c7e2622379b6c80"
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
