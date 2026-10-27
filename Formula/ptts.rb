class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.5.0/ptts-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "b8e8a889fbe7888604908a932a1643611e5156719c5c15829c700594e12a0b76"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.5.0/ptts-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "a5b9577c0a5577d7a3dc5a596b5444068b96ea2d1eb9708b616609b27dfe5420"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.5.0/ptts-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "982b7c3d3a9f49ed3e2ba80e2d8f4df9d1859384a79d22509ee4d80b36ed6227"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.5.0/ptts-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9563c32b5dc2d9c3ecc56aeb0766c0eaf679baf2ea08b5160ee2b3e4f9d0539c"
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
    assert_equal "ptts 0.5.0\n", shell_output("#{bin}/ptts --version")
  end
end
