class ContainerPrimer < Formula
  desc "Build or pull a container image and run it in a lightweight Linux VM"
  homepage "https://github.com/andreichenchik/container-primer"
  version "0.0.2"
  url "https://github.com/andreichenchik/container-primer/releases/download/v#{version}/container-primer-#{version}-arm64-macos.tar.gz"
  sha256 "13d102bb765c475ca97d7c8eea8b83382fd14df72756bca23c6f953a846a9e72"
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
