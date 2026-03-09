class Zanitize < Formula
  desc "Fast HTML+CSS sanitizer — DOM-aware, not regex-based"
  homepage "https://github.com/ndrean/zanitizer"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-darwin-arm64.tar.gz"
      sha256 "b3e5b42f6017d8e718ba2cb23ae80bcd01fb1928c10f93d06b230a5e6cd88c5d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-x86_64.tar.gz"
      sha256 "cac646896418163498e9e7f6a7f4c854d4b83aee695bfe2c5cdb693c2f963f38"
    end
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-aarch64.tar.gz"
      sha256 "6bd9c1f830f69d737b4d5bbe406f05aab452bd7ac2df9fce1437676681bb92fe"
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
