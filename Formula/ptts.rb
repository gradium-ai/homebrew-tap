class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.6.0/ptts-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "6d66f66a24c74032b518c55a299a85e9950755bee5de13041c731070eeddf11d"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.6.0/ptts-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "9a2e0e032bbe01289f2947d1ffe552ab49e98d99aa62e770036d3f69b98a5576"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.6.0/ptts-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96e315280ae3f2aed043698a6e5ff6fc2399ec917a0bf1ab24db370c5f4f6867"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.6.0/ptts-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6d0c31288e688b43bbbedf67a6eecaee86f050407124858901dda2ecf44ef89"
    end
  end

  def install
    bin.install "ptts"
  end

  def caveats
    <<~EOS
      Intel/x86_64 downloads require an x86-64-v3 CPU (AVX2, FMA, F16C).
      Linux downloads require glibc 2.35 or later.
      ptts downloads the default model on first use; --model picks another. --lang is required.
    EOS
  end

  test do
    assert_equal "ptts 0.6.0\n", shell_output("#{bin}/ptts --version")
  end
end
