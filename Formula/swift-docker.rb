class SwiftDocker < Formula
  desc "Test your swift packages with one command `swift docker test`"
  homepage "https://github.com/iainsmith/swift-docker"
  url "https://github.com/iainsmith/swift-docker/archive/0.3.0.tar.gz"
  sha256 "91e9d721705cd8c3f2aebcfc2912311b75e75976db48486cdcd50d17bfee2cbe"
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
