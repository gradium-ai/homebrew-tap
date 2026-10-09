class Ptts < Formula
  desc "Generate speech locally with Phonon"
  homepage "https://github.com/gradium-ai/xn-ptts"
  version "0.4.0-rc.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.1/ptts-0.4.0-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "e3516fca16107e56c1c7e4d063acf735187269c9b73ec2cd19b15716b9d4c346"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.1/ptts-0.4.0-rc.1-x86_64-apple-darwin.tar.gz"
      sha256 "00f8606cde0142dd828cf4b3a60305a8c9645cdd29ba132bd22e1dc8a53b35cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.1/ptts-0.4.0-rc.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f03df8b4fac3a78e66492020da0890f643a0029f15c3688e633c8eae6b29984"
    end
    on_intel do
      url "https://github.com/gradium-ai/xn-ptts/releases/download/v0.4.0-rc.1/ptts-0.4.0-rc.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6360f58f4463ec2052f5e14e7de9c3fdf68784b0067b15742859267680226cc"
    end
  end

  def install
    bin.install "ptts"
  end

  def caveats
    <<~EOS
      Intel/x86_64 downloads require an x86-64-v3 CPU (AVX2, FMA, F16C).
      Linux downloads require glibc 2.35 or later.
      Supply a model with --dir or --repo and a language with --lang.
    EOS
  end

  test do
    assert_equal "ptts 0.4.0-rc.1\n", shell_output("#{bin}/ptts --version")
  end
end
