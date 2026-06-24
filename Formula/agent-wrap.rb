class AgentWrap < Formula
  desc "Run a containerized agent in a lightweight, sandboxed Linux VM"
  homepage "https://github.com/andreichenchik/agent-wrap"
  version "0.1.0"
  url "https://github.com/andreichenchik/agent-wrap/releases/download/v#{version}/agent-wrap-#{version}-arm64-macos.tar.gz"
  sha256 "79d6c051ae457ecf888ac388d505a7c5b53228f0dec87824ab506be230f140ce"
  license :cannot_represent

  depends_on "container"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "agent-wrap"
  end

  def caveats
    <<~EOS
      agent-wrap requires an Apple silicon Mac running macOS 26+.
      `--build-image` needs the container service running: `container system start`
      (or `brew services start container`). `--image` runs standalone.
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/agent-wrap --help")
  end
end
