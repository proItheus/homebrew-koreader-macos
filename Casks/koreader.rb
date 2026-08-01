cask "koreader" do
  version "v2026.07.1"                        # auto-updated by CI

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "f6f3feda6ba519e2aad16992e4aaa57c615de7a89ff816f824e15a4bde6ecb13",
         intel: "d94c6fab7a7c12fd8abb89596df283fbbcec98518923c694b140c36601c7614e"

  url "https://github.com/proItheus/homebrew-koreader-macos/releases/download/koreader-v#{version}/koreader-macos-#{arch}.7z",
      verified: "github.com/proItheus/"
  name "KOReader"
  desc "Document viewer for PDF, EPUB, DJVU, FB2, CBZ"
  homepage "https://koreader.rocks/"

  depends_on formula: "p7zip"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/KOReader.app"],
                   sudo: false
  end

  app "KOReader.app"

  caveats <<~EOS
    KOReader is unsigned and not notarized. Quarantine has been
    stripped automatically. If Gatekeeper still blocks it, run:
      sudo xattr -rd com.apple.quarantine /Applications/KOReader.app
  EOS
end
