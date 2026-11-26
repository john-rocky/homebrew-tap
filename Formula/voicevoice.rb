class Voicevoice < Formula
  desc "Claude Code の応答を日本語音声で読み上げるCLIツール（VOICEVOX連携）"
  homepage "https://github.com/john-rocky/voicevoice"
  url "https://github.com/john-rocky/voicevoice/releases/download/v0.1.0/voicevoice-0.1.0-arm64.tar.gz"
  sha256 "8b36dcf61c5fe725f2001a8154c80115f297af923fe461b01325c6f0347ea223"
  version "0.1.0"
  license "MIT"

  depends_on "jq"
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "voicevoice"
  end

  def caveats
    <<~EOS
      セットアップ:
        voicevoice setup    # VOICEVOX自動インストール + Claude Code連携

      使い方:
        voicevoice on       # 読み上げON
        claude              # Claude Code を起動
    EOS
  end

  test do
    assert_match "voicevoice", shell_output("#{bin}/voicevoice --help 2>&1")
  end
end
