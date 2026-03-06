class Zanitize < Formula
  desc "Fast HTML+CSS sanitizer — DOM-aware, not regex-based"
  homepage "https://github.com/ndrean/zanitizer"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-darwin-arm64.tar.gz"
      sha256 "8639d453c4d32a042083ed01dc36ce13d0c8eb7f3c788d7ce51f334a86dcb2c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-x86_64.tar.gz"
      sha256 "9c44b3c8b632f5a1177a3ae49769ff7e0a06bfa5685509fd49e3700b218de50d"
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
