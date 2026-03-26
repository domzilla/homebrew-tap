class Events < Formula
  desc "CLI tool for interacting with macOS Calendar and Reminders via EventKit"
  homepage "https://github.com/domzilla/events"
  url "https://github.com/domzilla/events/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "6fbf499595714f6c68180a46788eb269904bfd0a397be123ac1c29199b841e11"
  license "MIT"
  head "https://github.com/domzilla/events.git", branch: "main"

  bottle do
    root_url "https://github.com/domzilla/events/releases/download/v1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6087c54f4916e6d6d7e275351b684421d064c225266b48e4ac51ed9be64f10a6"
    sha256 cellar: :any_skip_relocation, tahoe: "a02700a37fd219ecbda57998257d388c86d768e5204d7e656fed2c3b65b0f575"
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
