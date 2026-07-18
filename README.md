# richawo/homebrew-tap

Homebrew tap for [Yaps](https://yaps.ai/) — dictation, text-to-speech, and on-device AI notes for macOS.

## Install

```sh
brew install --cask richawo/tap/yaps
```

## Update

Yaps updates itself in place (the app has a built-in updater), so you rarely need
Homebrew to upgrade it. Run `brew upgrade --cask yaps` only to keep Homebrew's own
records in sync with the version already installed.

## Uninstall

```sh
brew uninstall --cask yaps
```

To also remove Yaps' application-support, cache, and preference data:

```sh
brew uninstall --zap --cask yaps
```

The zap **never touches `~/Documents/Yaps Vault`** — your notes are yours and stay
on disk (they are often iCloud-synced). Delete that folder yourself if you want it gone.
