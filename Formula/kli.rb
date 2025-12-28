class Kli < Formula
  desc "Kraken Command Line Interface"
  homepage "https://github.com/kraken-teknologies/kli"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli/v0.0.3/kli_0.0.3_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli/v0.0.3/kli_0.0.3_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli/v0.0.3/kli_0.0.3_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli/v0.0.3/kli_0.0.3_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "kli"
  end

  test do
    system "#{bin}/kli", "version"
  end
end
