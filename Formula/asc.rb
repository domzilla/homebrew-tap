class Asc < Formula
  desc "App Store Connect API client for AI agents, with a built-in blocklist"
  homepage "https://github.com/domzilla/asc"
  url "https://github.com/domzilla/asc/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "72090fb948780eeb197acc150bee666b7642125f6d80caca5435fd06ff6e9820"
  license "MIT"
  head "https://github.com/domzilla/asc.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/asc/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7f0532590a9902a64b63f8f9dbfab92f65f2b81d661ea70713e17de7a07a5ec3"
    sha256 cellar: :any_skip_relocation, tahoe: "4d86ee75d666d4cdd22664fa0ff099545a5125e8316fed5682ccfc5aa0505292"
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
