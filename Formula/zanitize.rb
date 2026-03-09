class Zanitize < Formula
  desc "Fast HTML+CSS sanitizer — DOM-aware, not regex-based"
  homepage "https://github.com/ndrean/zanitizer"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-darwin-arm64.tar.gz"
      sha256 "726179e92489df23bdb2501c2930e44f0fd6c609b941fdd08c5798eddf78b720"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-x86_64.tar.gz"
      sha256 "917a2fe917480e61a13635ce65987bd370d8ed1631b7d3c9edfabacb9109c650"
    end
    on_arm do
      url "https://github.com/ndrean/zanitizer/releases/download/v#{version}/zan-linux-aarch64.tar.gz"
      sha256 "2a4c888ccf3220aaacf0f6e86b3945dd2fef8f1e516ef82424a2cf706944924c"
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
