cask "go2shell" do
  version "1.0.3"

  on_arm do
    sha256 "d3e296fb5ef31b307464642ff4e1637adb355ff8644fa777b79c97c2ddbe436d"
    url "https://github.com/solarhell/go2shell/releases/download/v#{version}/go2shell-macOS-arm64.zip"
  end

  on_intel do
    sha256 "b06e250f11387847336debde65c610f7e6a64faa807c461fbe48cc814df76a52"
    url "https://github.com/solarhell/go2shell/releases/download/v#{version}/go2shell-macOS-x86_64.zip"
  end

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
