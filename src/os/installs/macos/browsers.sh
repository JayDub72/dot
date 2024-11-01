#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Browsers\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

printf "\n"

# brew_install "Chrome" "google-chrome" "--cask"
# brew_install "Chrome Canary" "google-chrome-canary" "--cask" "homebrew/cask-versions"
# brew_install "Chromium" "chromium" "--cask" "homebrew/cask-versions"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Firefox web browser" "firefox" "--cask"
# brew_install "Firefox Developer" "firefox-developer-edition" "--cask" "homebrew/cask-versions"
# brew_install "Firefox Nightly" "firefox-nightly" "--cask" "homebrew/cask-versions"
 
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
