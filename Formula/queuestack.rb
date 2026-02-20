class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "11df5c56841a8e097c50f352804818b86c338debf6999cf38b002b3eba2c364e"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9fede5f8db92848f467c8c215a8bddb56002018b280e167085a67f9b5e43d194"
    sha256 cellar: :any_skip_relocation, sonoma: "3545ad6b58fb2d50bcc125a4acd426cc83c9a7b6849c399b65621e7468da79ce"
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
