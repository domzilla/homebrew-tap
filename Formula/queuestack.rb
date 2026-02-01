class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "97c15d71f6fb0f64d1323cbdeb0defc58ff16cfee894314e034669b22c64f466"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "300f0ee66fa3123aeb4184041df154987ebe83dd22c59fa7b3562206f907c653"
    sha256 cellar: :any_skip_relocation, sonoma: "80f73b88f662d5bf4b61b951a450f49ef291e66c6589be59fadda3c1116b4ccd"
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
