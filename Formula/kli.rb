class Kli < Formula
  desc "Kraken Command Line Interface"
  homepage "https://github.com/krakenteknologies/kli"
  url "https://github.com/krakenteknologies/kli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  head "https://github.com/krakenteknologies/kli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/kli"
  end

  test do
    system "#{bin}/kli", "version"
  end
end
