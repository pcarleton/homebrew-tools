# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Tfdr < Formula
  desc "A CLI utility for manipulating Terraform states and plans"
  homepage "github.com/pcarleton/tfdr"
  url "https://s3-us-west-1.amazonaws.com/pcarleton-homebrew-tools/tfdr/tfdr.tar.gz"
  sha256 "361e66fcc2e38d90e7a7043f27b94a09e6dca1ba999ad3f590f895f3974fa424"
  depends_on "golang" => :build
  version  "v0.1"

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/pcarleton/tfdr"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"tfdr", "."
    end
  end

  test do
    system "#{bin}/tfdr"
  end
end
