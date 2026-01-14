class Qstack < Formula
  desc "Minimal, scriptable task and issue tracker for agent-driven workflows"
  homepage "https://github.com/domzilla/qstack"
  url "https://github.com/domzilla/qstack/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d1d08cac33f310afcf8aa03c19ccd83a5cd4efb7ea74ab9a93dc711c26b8ca93"
  license "MIT"
  head "https://github.com/domzilla/qstack.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/qstack/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "22f78cd20d932b1ee3016e6ce6093c45fe7d0948a9006cec38a3e583c3531bd5"
    sha256 cellar: :any_skip_relocation, sonoma: "07a110b4d21141069c6aeee1015308c561849d4e94f7086559c74029bd47b2aa"
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
