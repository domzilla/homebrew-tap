class Events < Formula
  desc "CLI tool for interacting with macOS Calendar and Reminders via EventKit"
  homepage "https://github.com/domzilla/events"
  url "https://github.com/domzilla/events/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "5b3837cc9c51a9e2d5897dff42e52b7dbb350f8a59ecf9f224631c891db36742"
  license "MIT"
  head "https://github.com/domzilla/events.git", branch: "main"

  bottle do
    root_url "https://github.com/domzilla/events/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ce0652afaa174a5c1551ec8a708df9afc4ef7a89c9b031373f42bbc405b59d26"
    sha256 cellar: :any_skip_relocation, tahoe: "7bd078c0187befcd66a2896c76d29daf89e645d61656c1fb41dd8b0f62e52f61"
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
