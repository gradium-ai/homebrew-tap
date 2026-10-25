class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.4.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.2/ptts-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "e606d3c8558ac0f3251275664492bc3330dd3fcab341329ab73a6151e0e4e613"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.2/ptts-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "b710c437665bbcf188b407675f87d492625b7b631bdc877de28975db1af5ac03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.2/ptts-0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47e8a9247ceb26c199d38909111ff2c8684e190650e5200368c66a840eca0a96"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.2/ptts-0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41ac3d986e633a8130c1870a31853043448aa4245c9f41b585edb07bfdc529ad"
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
    assert_equal "ptts 0.4.2\n", shell_output("#{bin}/ptts --version")
  end
end
