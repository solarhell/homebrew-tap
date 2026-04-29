cask "go2shell" do
  version "1.0.2"
  sha256 "758d2c5eddc535fd2ad259b478dac1dc049e38dcb8b1e19af1cd604c618c5932"

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
