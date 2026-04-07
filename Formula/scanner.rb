class Scanner < Formula
  desc "macOS command-line document scanning utility"
  homepage "https://github.com/domzilla/scanner"
  url "https://github.com/domzilla/scanner/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d702e8d13cb081554573f3f428f2e18aec2508a91d5882baf108d746c1b96e21"
  license "MIT"
  head "https://github.com/domzilla/scanner.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/scanner/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6a7d817bb6fae3832e28f9d29165f8dce251223f3e3e2027b76b4b8497069096"
    sha256 cellar: :any_skip_relocation, tahoe: "ba59790d3c6bbb5183f60212ccaa78bde0b34c9964d2c5b51909f3ba6c704642"
  end

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    cd "src" do
      system "xcodebuild", "-scheme", "scanner",
             "-configuration", "Release",
             "-derivedDataPath", buildpath/"build",
             "-destination", "platform=macOS",
             "CODE_SIGN_IDENTITY=-",
             "CODE_SIGNING_ALLOWED=NO",
             "MACOSX_DEPLOYMENT_TARGET=14.0",
             "build"
    end
    bin.install buildpath/"build/Build/Products/Release/scanner"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scanner --version")
  end
end
