class AppleCli < Formula
  desc "App Store Connect (with a built-in blocklist) and Apple Ads API clients for AI agents"
  homepage "https://github.com/domzilla/apple-cli"
  url "https://github.com/domzilla/apple-cli/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "a8303d6886de94248142e798e22f18e1e57be8bc855992b535212cd9eaf88b68"
  license "MIT"
  head "https://github.com/domzilla/apple-cli.git", branch: "master"

  bottle do
    root_url "https://github.com/domzilla/apple-cli/releases/download/v1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d62ab8d9d84df002b96088cd5d1db3710e8a6d3b318f2665da4fa31fe60712e9"
    sha256 cellar: :any_skip_relocation, tahoe: "e87b58ce5b853066fe0fbf74f7fdeb04a4821db2f479b7e3f98f609a33df23a5"
  end

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/asc", ".build/release/asa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
    assert_match version.to_s, shell_output("#{bin}/asa --version")
  end
end
