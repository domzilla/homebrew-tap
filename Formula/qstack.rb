class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8cddbbc2659fd225d79dca859c4fbd5641726495967fd9fd472c094677319141"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "90e1dee7f6e4e261d338c811755c61272bab6367d0989bb12f551e1fd195944f"
    sha256 cellar: :any_skip_relocation, sonoma: "44c707f0567d2319a58e5015839e15c7a5e97a6c2a3f30b2b7453f5dbd9ddc06"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"qstack", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qstack --version")
  end
end
