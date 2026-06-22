cask "koreader" do
  version "0.0.0"                        # auto-updated by CI
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  arch arm: "arm64", intel: "x86_64"

  url "https://github.com/OWNER/REPO/releases/download/koreader-v#{version}/koreader-macos-#{arch}.7z",
      verified: "github.com/OWNER/"
  name "KOReader"
  desc "Document viewer for PDF, EPUB, DJVU, FB2, CBZ"
  homepage "https://koreader.rocks/"

  depends_on cask: "keka"

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
