#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Applications\n\n"

brew_install "Password manager that keeps all passwords secure behind one password" "1password"
brew_install "Application uninstaller" "appcleaner"
# brew_install "Authy" "authy" - deprecated on MacOS
brew_install "Data backup and storage service" "backblaze"
brew_install "Voice and text chat software" "discord"
brew_install "Client for the Google Drive storage service" "google-drive"
brew_install "Utility to hide menu bar items" "hiddenbar"
brew_install "Terminal emulator as alternative to Apple's Terminal app" "iterm2"
brew_install "Bible study software" "logos"
brew_install "Microsoft Office" "microsoft-office"
brew_install "VPN client for secure internet access and private browsing" "nordvpn"
brew_install "App to write, plan, collaborate, and get organised" "notion"
brew_install "Knowledge base that works on top of a local folder of plain text Markdown files" "obsidian"
brew_install "Finds large, unwanted files and deletes them" "omnidisksweeper"
brew_install "Home media player" "plex-media-player"
# brew_install "Rectangle" "rectangle" "--cask" # macOS Sequoia has rendered this less helpful
brew_install "Music streaming service" "spotify"
brew_install "Unpacks archive files" "the-unarchiver"
# brew_install "Transmission" "transmission"
