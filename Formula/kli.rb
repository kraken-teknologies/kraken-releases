class Kli < Formula
  desc "Kraken Command Line Interface"
  homepage "https://github.com/kraken-teknologies/kraken-releases"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.3/kli-v0.0.3-darwin-arm64.tar.gz"
      sha256 "sha256:d9f2e4cc451a17424d2e769b6412e9a10934a5fb4c76de4d5500b67e58ea18ff"
    else
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.3/kli-v0.0.3-darwin-amd64.tar.gz"
      sha256 "sha256:0b10e7ae90ed50b792d8592032184d600a3511adbf6e6f068b1e6fb62d257206"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.3/kli-v0.0.3-linux-arm64.tar.gz"
      sha256 "51f77b11918a65f7d4a43e8078b157004b8de2a485e1b17edb58ac64f7ea4a2b"
    else
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.3/kli-v0.0.3-linux-amd64.tar.gz"
      sha256 "90f2f0d90d23869aac45a459dcd29b5c9e7e8366fb9ba77cd8dca4cbb4912332"
    end
  end

  def install
    bin.install "kli"
  end

  test do
    system "#{bin}/kli", "version"
  end
end
