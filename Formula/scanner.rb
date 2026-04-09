class Scanner < Formula
  desc "macOS command-line document scanning utility"
  homepage "https://github.com/domzilla/scanner"
  url "https://github.com/domzilla/scanner/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "abd412b670d46a0bf9a0f887c198295aa36b5451fb46fe9a92f7f686cfb70f74"
  license "MIT"
  head "https://github.com/domzilla/scanner.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/scanner/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "832be4f05ddd51b1ef2d7984c65c4afab7dacb171fadee6f4745d99863eb3159"
    sha256 cellar: :any_skip_relocation, tahoe: "159806f10e7b476d8fff72963d0a730ba0f5b6156403b30a3a7fa6197e12cf73"
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
