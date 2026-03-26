class Events < Formula
  desc "CLI tool for interacting with macOS Calendar and Reminders via EventKit"
  homepage "https://github.com/domzilla/events"
  url "https://github.com/domzilla/events/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "779b95d90644798984d15006b6df6182dcf845e4322aabbceec62a82f840f7cd"
  license "MIT"
  head "https://github.com/domzilla/events.git", branch: "main"

  bottle do
    root_url "https://github.com/domzilla/events/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "32604d50768e48777ca10dae92507193e5ba0337e7991153a19d0ebe9087b9d8"
    sha256 cellar: :any_skip_relocation, tahoe: "825257666798faaadfef48a24069528fcfb4305bc84c1817f083ca757801b740"
  end

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    cd "src" do
      system "xcodebuild", "-scheme", "events",
             "-configuration", "Release",
             "-derivedDataPath", buildpath/"build",
             "-destination", "platform=macOS",
             "CODE_SIGN_IDENTITY=-",
             "CODE_SIGNING_ALLOWED=NO",
             "MACOSX_DEPLOYMENT_TARGET=14.0",
             "build"
    end
    bin.install buildpath/"build/Build/Products/Release/events"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/events --version")
  end
end
