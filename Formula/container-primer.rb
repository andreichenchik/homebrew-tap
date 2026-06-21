class ContainerPrimer < Formula
  desc "Build or pull a container image and run it in a lightweight Linux VM"
  homepage "https://github.com/andreichenchik/container-primer"
  version "0.0.3"
  url "https://github.com/andreichenchik/container-primer/releases/download/v#{version}/container-primer-#{version}-arm64-macos.tar.gz"
  sha256 "aa31e87add3da91e34b1edd8d67d3da4757069ed2fd080aafe8a0dc3b7aceec1"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "container-primer"
  end

  def caveats
    <<~EOS
      container-primer requires an Apple silicon Mac running macOS 26+.
      Podman (preferred) or Docker is only needed for `--build-image`; `--image` runs standalone.
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/container-primer --help")
  end
end
