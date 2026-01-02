class Kli < Formula
  desc "Kraken Command Line Interface"
  homepage "https://github.com/kraken-teknologies/kraken-releases"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.4/kli-v0.0.4-darwin-arm64.tar.gz"
      sha256 "b634d5f18183a188599a6da92c5a5a79277911a6dcea2903806491f2458eab3f"
    else
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.4/kli-v0.0.4-darwin-amd64.tar.gz"
      sha256 "53eb180b1f417f78b89be43af2c1e24bf9781e63a610d9c84153c5a00e46ffe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.4/kli-v0.0.4-linux-arm64.tar.gz"
      sha256 "52e49e4c1ad5221d5e9ca26e8fa6a6a0bb2c11ab0f1231e2c014c688116460ec"
    else
      url "https://github.com/kraken-teknologies/kraken-releases/releases/download/kli%2Fv0.0.4/kli-v0.0.4-linux-amd64.tar.gz"
      sha256 "7fc34d9edcf587efe7bacf8b2b97b15fc0186456a7567b83ceabc1f0b2e0b8a8"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "kli-darwin-arm64" => "kli"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "kli-darwin-amd64" => "kli"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "kli-linux-arm64" => "kli"
    else
      bin.install "kli-linux-amd64" => "kli"
    end
  end

  test do
    system "#{bin}/kli", "version"
  end
end
