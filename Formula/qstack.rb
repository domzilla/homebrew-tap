class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "2f7faaf2134c4717b29dad8cad4653d4268167d499a291292fd3dcc06b5c779c"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "572ee0f7d8e696b98f88e276a19b01c7a4741694dbbf243a27a35b2338b712c1"
    sha256 cellar: :any_skip_relocation, sonoma: "141b81205534b7710d245f0a866e186b17afde8511dd2963373cfad5d5e79504"
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
