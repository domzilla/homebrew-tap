class AppleCli < Formula
  desc "App Store Connect API client for AI agents, with a built-in blocklist"
  homepage "https://github.com/domzilla/apple-cli"
  url "https://github.com/domzilla/apple-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "57fd4075673c3334ce879a57d7207b24edb5989d04599d352f0c16a3cc9fed84"
  license "MIT"
  head "https://github.com/domzilla/apple-cli.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/apple-cli/releases/download/v1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2d272b1b0274fa23753f1e3e01017e7105a7478f930719f32b599ad91d304581"
    sha256 cellar: :any_skip_relocation, tahoe: "089b3a39b0f66c3e4ccbe38c1af96f230aa349647289dbffa63b84c0fd812f5a"
  end

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/asc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
