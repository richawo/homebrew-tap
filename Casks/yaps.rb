cask "yaps" do
  arch arm: "aarch64", intel: "x64"

  version "2.3.10"
  sha256 arm:   "0d554ab132fd24b15f401aaa2bc68d498de81ab609f7ee250d36b16caea5676e",
         intel: "d0904142824757ac8bc0faffb85b8f2dc941be13cfd03d7824d1a270d9855979"

  url "https://github.com/richawo/yaps-releases/releases/download/v#{version}/Yaps_#{version}_#{arch}.dmg",
      verified: "github.com/richawo/yaps-releases/"
  name "Yaps"
  desc "Dictation, text-to-speech, and on-device AI notes"
  homepage "https://yaps.ai/"

  livecheck do
    url "https://github.com/richawo/yaps-releases"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Yaps.app"

  uninstall quit: "com.yaps.app"

  # NEVER add to zap: "~/Documents/Yaps Vault" (the user's notes — user content,
  # often iCloud-synced) and "~/.cache/huggingface" (shared with other tools).
  zap trash: [
    "~/Library/Application Support/app.yaps",
    "~/Library/Application Support/com.yaps",
    "~/Library/Application Support/com.yaps.app",
    "~/Library/Caches/com.yaps.app",
    "~/Library/Caches/yaps",
    "~/Library/Containers/com.yaps.app",
    "~/Library/Cookies/com.yaps.app.binarycookies",
    "~/Library/HTTPStorages/com.yaps.app",
    "~/Library/HTTPStorages/yaps",
    "~/Library/Logs/app.yaps",
    "~/Library/Logs/com.yaps.app",
    "~/Library/Preferences/com.yaps.app.plist",
    "~/Library/Preferences/yaps.plist",
    "~/Library/Saved Application State/com.yaps.app.savedState",
    "~/Library/Saved Application State/yaps.savedState",
    "~/Library/WebKit/com.yaps.app",
    "~/Library/WebKit/yaps",
  ]
end
