class Zanitize < Formula
  desc "Fast HTML+CSS sanitizer — DOM-aware, not regex-based"
  homepage "https://github.com/ndrean/zanitizer"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-darwin-arm64.tar.gz"
      sha256 "8de6f47d9aff0be9b48b4d4ae0553021f2c0216c6b82e9feb8ab984184236b7e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-x86_64.tar.gz"
      sha256 "f15a088e57c9641877b07dd9149ac4b31f4ccfa59dce8f8f64a5636198f1839b"
    end
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-aarch64.tar.gz"
      sha256 "c5b232abb9ba6640a8a68a8cda8171ca09dd644ab78c216a2a78a398f10c7985"
    end
  end
  
  def install
    bin.install "zan"
  end

  test do
    output = pipe_output("#{bin}/zan -", "<script>alert(1)</script><p>ok</p>")
    assert_match "<p>ok</p>", output
  end
end
