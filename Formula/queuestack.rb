class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "cfa9b1987cf4a59f398149137536ebf2767bffd2414b7f7a0d0b1d8c29337cf6"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e764f00e5a2324811a8ba6932a15b513dcd8ffad42b814d425146d8b90bad2a0"
    sha256 cellar: :any_skip_relocation, sonoma: "9245851521ef95e81d1bd4fab06dc1e0d462b7f9a49485cdae64e8923fc72bda"
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
