class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.0/ptts-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "14b41430c53a08c1666518210f066a5dc3537fc1d191a0d284f6db1451fd2659"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.0/ptts-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "4fa6236ce17c19ffd6d783072131e8bfb3b1cbdf75190f809bf7a6b98af2f9f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.0/ptts-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1bd6dba811bbe321b2b313394bc2a3b870303f807355fc82f85f5de123623e05"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.0/ptts-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c0b2b3da0a1e1d64337df865754cefd480102d24c0438f80e3043c8a2bbbcc6"
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
    assert_equal "ptts 0.7.0\n", shell_output("#{bin}/ptts --version")
  end
end
