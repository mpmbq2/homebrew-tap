class DigiDx < Formula
  desc "Local-first FT8 & transceiver daemon with embedded web console"
  homepage "https://github.com/mpmbq2/digi-dx"
  url "https://github.com/mpmbq2/digi-dx/releases/download/v2.0.0/digi-dx-darwin-aarch64.tar.gz"
  version "2.0.0"
  sha256 "PLACEHOLDER_UPDATED_BY_RELEASE_WORKFLOW"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64
  depends_on "hamlib"

  def install
    bin.install "digi-dx"
  end

  service do
    run [opt_bin/"digi-dx", "serve"]
    keep_alive crashed: true
    log_path var/"log/digi-dx.log"
    error_log_path var/"log/digi-dx.log"
    environment_variables(
      DIGI_DX_BIND: "0.0.0.0",
      DIGI_DX_PORT: "8788",
      PATH:         std_service_path_env,
      RUST_LOG:     "info",
    )
  end

  def caveats
    <<~EOS
      Start Digi-Dx in the background (and automatically on login):
        brew services start digi-dx

      Then open the web console in your browser:
        http://127.0.0.1:8788

      Optional: install WSJT-X for full weak-signal jt9 decoding
      (otherwise Digi-Dx uses its built-in ft8_lib decoder):
        brew install --cask wsjtx

      Note: on first run, macOS may ask for Microphone permission so
      Digi-Dx can read RX audio from your radio's USB soundcard.
      If RX audio appears silent, run:
        digi-dx preflight --probe-audio
      and allow access in System Settings -> Privacy & Security -> Microphone.
    EOS
  end

  test do
    assert_match "digi-dx", shell_output("#{bin}/digi-dx --help")
  end
end
