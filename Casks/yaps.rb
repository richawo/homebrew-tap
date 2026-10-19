cask "yaps" do
  arch arm: "aarch64", intel: "x64"
  release_target = on_arch_conditional arm: "darwin-aarch64", intel: "darwin-x86_64"

  version "2.4.1599"
  sha256 arm:   "c429040e58ba97c64891c69bff7d0fd0aa1fbe923d0d99449752df73400ce75a",
         intel: "fb03f40810d344d03127497b47dfb40c663b3ce124c3ca25338275c77e1939c7"

  url "https://downloads.yaps.ai/releases/v#{version}/Yaps_#{version}_#{arch}.dmg",
      verified: "downloads.yaps.ai/"
  name "Yaps"
  desc "Dictation, text-to-speech, and on-device AI notes"
  homepage "https://yaps.ai/"

  livecheck do
    url "https://downloads.yaps.ai/channels.json"
    strategy :json do |json|
      json.dig("targets", release_target, "version")
    end
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
