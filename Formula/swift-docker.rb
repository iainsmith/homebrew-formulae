class SwiftDocker < Formula
  desc "Test your swift packages with one command `swift docker test`"
  homepage "https://github.com/iainsmith/swift-docker"
  url "https://github.com/iainsmith/swift-docker/archive/0.4.0.tar.gz"
  sha256 "b5519f390ebf1fff63c05d2936aa068e6a4f7f9bc9f2847acf4d4dfe81e4fa14"
  depends_on :xcode => :build

  def install
    if MacOS.version <= "10.14"
      system "swift", "build", "--disable-sandbox", "--configuration", "release", "-Xswiftc",
      "-static-stdlib"
    else
      system "swift", "build", "--disable-sandbox", "--configuration", "release"
    end
    bin.install ".build/release/swift-docker"
  end

  test do
    system "swift", "package", "init", "--type", "library"
    system "swift docker test"
  end
end
