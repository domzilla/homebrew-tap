class Asc < Formula
  desc "App Store Connect API client for AI agents, with a built-in blocklist"
  homepage "https://github.com/domzilla/asc"
  url "https://github.com/domzilla/asc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ec848c89161bc9b20da455c30e606695af4e2f86ede46d302d1a86dbbaeaf3d8"
  license "MIT"
  head "https://github.com/domzilla/asc.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/asc/releases/download/v1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "97abcc9b036bee08d72b5067b19ba53c9e732180c31871db96dda4bd159577b6"
    sha256 cellar: :any_skip_relocation, tahoe: "c5fa6e47d92ee5cf02e203473743a2b7c6dce06465da5303657045fe35810441"
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
