cask "parchment" do
  arch arm: "aarch64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "c6e48724d2c61dbd7c93b2ee49d60430553dcaec05d65b59443aa88d3db42aa1",
         intel: "e76158ea1ea428dac877d4afade2d9d4097e2587beb361380c806876bfc21da1"

  url "https://github.com/scrypt-kitty/parchment/releases/download/v#{version}/Parchment_#{version}_#{arch}.dmg",
      verified: "github.com/scrypt-kitty/parchment/"
  name "Parchment"
  desc "Fast, private, open-source Markdown viewer"
  homepage "https://github.com/scrypt-kitty/parchment"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Parchment.app"

  # The builds are unsigned, and Homebrew does *not* strip the quarantine
  # attribute — verified on Homebrew 6.0, where the old --no-quarantine flag no
  # longer exists. A Homebrew install therefore needs the same one-time step as
  # a manual download, which `caveats` below spells out.

  caveats <<~EOS
    Parchment is not code-signed, so macOS quarantines it on first launch.
    Clear the flag once:

      xattr -dr com.apple.quarantine /Applications/Parchment.app

  EOS

  zap trash: [
    "~/Library/Application Support/io.parchment.viewer",
    "~/Library/Caches/io.parchment.viewer",
    "~/Library/Saved Application State/io.parchment.viewer.savedState",
    "~/Library/WebKit/io.parchment.viewer",
  ]
end
