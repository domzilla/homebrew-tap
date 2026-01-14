class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "30729e9a86e95c0a06a004bb21ca7ccc6a157b2c9cb6b979f33bb6cc55359f95"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d8e9a5ed90eea2a308ee6d1557a91b661dcf8b21e910afc1eb7d3dd0a189d81"
    sha256 cellar: :any_skip_relocation, sonoma: "1a5593b240cee8d793c4b05df132ecfdca2167bb421f30aed8309ed61837c3c1"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"qstack", "completions")
  end

  test do
    system bin/"qstack", "--version"
    system bin/"qstack", "init"
  end
end
