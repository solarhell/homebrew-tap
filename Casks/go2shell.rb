cask "go2shell" do
  version "1.0.0"
  sha256 "6c0b8f6cb2b891f20e0acb89e2759f4467fdaaf275fd60fc2591172b76e70a50"

  url "https://github.com/solarhell/go2shell/releases/download/v#{version}/go2shell.zip"
  name "go2shell"
  desc "Open terminal from Finder"
  homepage "https://github.com/solarhell/go2shell"

  depends_on macos: ">= :sequoia"

  app "go2shell.app"

  caveats do
    <<~EOS
      go2shell is not notarized. On first launch, macOS Gatekeeper may block it.
      To allow it, run:
        xattr -d com.apple.quarantine /Applications/go2shell.app

      Or go to System Settings > Privacy & Security > click "Open Anyway".
    EOS
  end
end
