class ContainerPrimer < Formula
  desc "Build or pull a container image and run it in a lightweight Linux VM"
  homepage "https://github.com/andreichenchik/container-primer"
  version "0.0.1"
  url "https://github.com/andreichenchik/container-primer/releases/download/v#{version}/container-primer-#{version}-arm64-macos.tar.gz"
  sha256 "784ce3bfdb1aa4d96f2fc0c91263cb45e507bcdae0a6ec1150a5c617b8f67d6e"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    # Keep the binary and its *.bundle resources (loaded via Bundle.module) adjacent.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"container-primer"
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
