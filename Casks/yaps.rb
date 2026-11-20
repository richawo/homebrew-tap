cask "yaps" do
  arch arm: "aarch64", intel: "x64"
  release_target = on_arch_conditional arm: "darwin-aarch64", intel: "darwin-x86_64"

  on_arm do
    version "2.4.3828"
    sha256 "cd2e3bcc83dd2efa25398d5e82e22735c05bc201215c6e246a8cccc5a24fd7c4"
  end
  on_intel do
    version "2.4.3930"
    sha256 "6e42b1e6bba7b51e5b4a8cc8995ba3baecdfac79c714723715a14971c98c52e2"
  end

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
