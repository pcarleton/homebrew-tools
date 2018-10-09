# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Moon < Formula
  desc "A CLI utility for information about the moon"
  homepage ""
  url "https://github.com/pcarleton/moon/archive/v0.1.2.tar.gz"
  sha256 "674c2547db20f112605b31a14f1da06805e6d2d0b255b8a1ab3ac825ebf8837f"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
    system "#{bin}/moon"
  end
end
