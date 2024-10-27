#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Applications\n\n"

brew_install "1Password" "1password"
brew_install "App Cleaner" "appcleaner"
# brew_install "Authy" "authy" - deprecated on MacOS
# brew_install "Backblaze" "backblaze" - brew install largely useless
brew_install "Discord" "discord"
brew_install "Google Drive" "google-drive"
brew_install "Hidden Bar" "hiddenbar"
brew_install "iTerm2" "iterm2"
brew_install "Logos" "logos"
brew_install "Microsoft Office" "microsoft-office"
brew_install "NordVPN" "nordvpn"
brew_install "Notion.so" "notion"
brew_install "Obsidian" "obsidian"
brew_install "Omni Disk Sweeper" "omnidisksweeper"
brew_install "Plex Media Player" "plex-media-player"
# brew_install "Rectangle" "rectangle" "--cask" # macOS Sequoia has rendered this less helpful
brew_install "Spotify" "spotify"
brew_install "The Unarchiver" "the-unarchiver"
# brew_install "Transmission" "transmission"
