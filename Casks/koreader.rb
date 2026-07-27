cask "koreader" do
  version "v2026.07"                        # auto-updated by CI

  arch arm: "arm64", intel: "x86_64"
  sha256 arm:   "8648c5f487ad5762aefaca9a2f6a6d73e6fad477d13ee6255864f673dcdc23a1",
         intel: "6b45a041aff2f32dc719230dc268fc5d5536f19f93b09abace23dea3059e359c"

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
