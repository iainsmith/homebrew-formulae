class SwiftDocker < Formula
  desc "Test your swift packages with one command `swift docker test`"
  homepage "https://github.com/iainsmith/swift-docker"
  url "https://github.com/iainsmith/swift-docker/archive/0.2.0.tar.gz"
  sha256 "92ec0fe6944e8fc02dfe4efe2357c3b527325ca1f5eae28aeb9e170c044f25de"
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
