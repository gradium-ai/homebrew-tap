class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0/ptts-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "7b26c8b9d98f5b5894de09af2aad35e64827e8475c07b003557cafc1ebba6a40"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0/ptts-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "17e67ef6e708b885f9a15172ab76be22cb02cdb8bf6afc9d00efcc06ced670b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0/ptts-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1ae0e30bcab25bf5efc0c308ec01946b43f797b1bd0b0462037fb1789a61ffc"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0/ptts-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ad1912856e6d91975fbd51b2f3a4dc774badc00eebe85c51a3908d8b1f5cb0a"
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
    assert_equal "ptts 0.4.0\n", shell_output("#{bin}/ptts --version")
  end
end
