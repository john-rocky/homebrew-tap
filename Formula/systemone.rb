class Systemone < Formula
  desc "Typed decisions on device: the /v1/systemone endpoint over a local model"
  homepage "https://github.com/john-rocky/coreai-kit"
  url "https://github.com/john-rocky/coreai-kit/releases/download/0.8.0/systemone-0.8.0-macos-arm64.zip"
  version "0.8.0"
  sha256 "0f1aa1e7e41388a325f9a18a3112bba9db5ae1f7ac61b3cc13158adff6eab76d"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  def install
    bin.install "systemone"
  end

  service do
    run [opt_bin/"systemone", "serve"]
    keep_alive true
    log_path var/"log/systemone.log"
    error_log_path var/"log/systemone.log"
  end

  def caveats
    <<~EOS
      The first `systemone serve` downloads MiniCPM5 2B (2.7 GB) into
      ~/Library/Application Support/CoreAIKit/Models; later starts load from there.
      Run it once in a terminal to watch the download, then keep it running:
        brew services start systemone     # http://127.0.0.1:8090/v1/systemone
      Log: #{var}/log/systemone.log
      For a coding agent, the same decisions as MCP tools:
        claude mcp add systemone -- #{opt_bin}/systemone mcp
    EOS
  end

  test do
    assert_match "systemone", shell_output("#{bin}/systemone --version")
  end
end
