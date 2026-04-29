cask "go2shell" do
  version "1.0.1"
  sha256 "8b5ab60648fd3e2f7ac6c1c9f4502c133eb1666b48b6eb8b9746ae9e6a0c44a4"

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
