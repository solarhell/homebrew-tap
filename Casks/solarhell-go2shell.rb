cask "solarhell-go2shell" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.3"
  sha256 arm:   "d3e296fb5ef31b307464642ff4e1637adb355ff8644fa777b79c97c2ddbe436d",
         intel: "b06e250f11387847336debde65c610f7e6a64faa807c461fbe48cc814df76a52"

  url "https://github.com/solarhell/go2shell/releases/download/v#{version}/go2shell-macOS-#{arch}.zip"
  name "go2shell"
  desc "Open terminal from Finder"
  homepage "https://github.com/solarhell/go2shell"

  depends_on macos: :sequoia

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
