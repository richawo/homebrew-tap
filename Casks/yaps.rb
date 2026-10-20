cask "yaps" do
  arch arm: "aarch64", intel: "x64"
  release_target = on_arch_conditional arm: "darwin-aarch64", intel: "darwin-x86_64"

  version "2.4.1719"
  sha256 arm:   "a79b17cac54ef68e982a0b9a3733ffab375a9df229b07e166ac73799f4668e4d",
         intel: "6f32c86cef1206c6da5406aa18c79e5178c4396a269c7a6af9a29cb63fa88ed6"

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
