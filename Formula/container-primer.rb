class ContainerPrimer < Formula
  desc "Build or pull a container image and run it in a lightweight Linux VM"
  homepage "https://github.com/andreichenchik/container-primer"
  version "0.0.4"
  url "https://github.com/andreichenchik/container-primer/releases/download/v#{version}/container-primer-#{version}-arm64-macos.tar.gz"
  sha256 "d5863429a7fe94453db14c90ef7ec2d793cdfc709aa3145e4c30c1b98d803d21"
  license :cannot_represent

  depends_on "container"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "container-primer"
  end

  def caveats
    <<~EOS
      container-primer requires an Apple silicon Mac running macOS 26+.
      `--build-image` needs the container service running: `container system start`
      (or `brew services start container`). `--image` runs standalone.
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/container-primer --help")
  end
end
