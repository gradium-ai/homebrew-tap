class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.4.0-rc.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.2/ptts-0.4.0-rc.2-aarch64-apple-darwin.tar.gz"
      sha256 "1bc3a726508f94f2e9d19dbf6b744bd381c1ab515798e3454cd07766443c9ddb"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.2/ptts-0.4.0-rc.2-x86_64-apple-darwin.tar.gz"
      sha256 "8b90c7a3f65f2015b8429f4c3ea2ec8cbc93ef337be897adfabe02817ca003f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.2/ptts-0.4.0-rc.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51d7f8b74fb0b284f6250b52e312fb7c765bb3fcf5b0b381579abd58129f1986"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.2/ptts-0.4.0-rc.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "860c6746117d9ba02d9166b5d1825e381b7b21cb39e0bb226162c8c0d2a26f15"
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
    assert_equal "ptts 0.4.0-rc.2\n", shell_output("#{bin}/ptts --version")
  end
end
