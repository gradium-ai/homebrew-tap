class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.7.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.1/ptts-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "8d726ce550d4001ba9c0f18615500bc72e0c1bdf8211cce98d4882242c585635"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.1/ptts-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "d084dc0d185e1ed17abaa63d011adb6dce209f8f391f8c35ddf6cd11e166b1ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.1/ptts-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "721de051ef3fa4d6ed0405f549b8cac596118604f8f63b975313c4debdec76d7"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.7.1/ptts-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e65eb2028f85565b69d7a7e6d88eef32a38b28d77860d2c75427e33163f4bbf"
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
    assert_equal "ptts 0.7.1\n", shell_output("#{bin}/ptts --version")
  end
end
