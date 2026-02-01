class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "0f99a359df3fa40a0750f06acc28d15908240c3caaa2e34f777b63ffe6a34b3d"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c7cf46b505f44ea812fcd7953d5171fa50ab9aa5e30b2ca221ce52d40356105c"
    sha256 cellar: :any_skip_relocation, sonoma: "ccf358a68a1d0f337522c73756a170e2671c6e042838ea278878fae6e20dd7aa"
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
