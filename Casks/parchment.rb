cask "parchment" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "91a92c8aeda99ce3b041b33d0131d20f43db5c8fa78a54076f417d9b379f820d",
         intel: "ca6bf3585a40edba555595313e3a8931a7f1f2e6a2929d73800b17b5b3222feb"

  url "https://github.com/scrypt-kitty/parchment/releases/download/v#{version}/Parchment_#{version}_#{arch}.dmg",
      verified: "github.com/scrypt-kitty/parchment/"
  name "Parchment"
  desc "Fast, private, open-source Markdown viewer"
  homepage "https://github.com/scrypt-kitty/parchment"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Parchment.app"

  # The builds are unsigned, so Gatekeeper quarantines them. Homebrew removes
  # the quarantine attribute for casks it installs, which is why `brew install`
  # avoids the right-click dance the README describes for manual downloads.

  zap trash: [
    "~/Library/Application Support/io.parchment.viewer",
    "~/Library/Caches/io.parchment.viewer",
    "~/Library/Saved Application State/io.parchment.viewer.savedState",
    "~/Library/WebKit/io.parchment.viewer",
  ]
end
