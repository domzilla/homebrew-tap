class Queuestack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/queuestack"
  url "https://github.com/domzilla/queuestack/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "e41d85913fedf68a81b7269f60388aad6d7a6f520d72379df074177159b18941"
  license "MIT"
  head "https://github.com/domzilla/queuestack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/queuestack/releases/download/v0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9228f66eec56d1978522ec8478b291c3637eca5545ce089cb98f3ffc2795a743"
    sha256 cellar: :any_skip_relocation, sonoma: "a67c1c2aba8e78a5fc25fc576c2649a0b61108b537214050da92027637cb3e2c"
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
