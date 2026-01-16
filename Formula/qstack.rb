class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "df728b3102efcf3c83e53fe41962412a09500ede5d4d5e57aeef4a686118a189"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4331a569cf7962aae40fbb9b0831bb87581466f463683efbaa51a1f75aa75567"
    sha256 cellar: :any_skip_relocation, sonoma: "82086e047cb28d4f2f373e4650c721f91ce2763171bfc039834b464de4c1c14c"
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
