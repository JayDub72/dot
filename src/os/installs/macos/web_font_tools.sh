#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Web Font Tools\n\n"

brew_install "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "" "bramstein/webfonttools"
brew_install "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "" "bramstein/webfonttools"
brew_install "Web Font Tools: WOFF2" "woff2" "" "bramstein/webfonttools"

brew_install "freetype fonts" "freetype"
brew_install "font-hack" "font-hack" "" "homebrew/cask-fonts"
brew_install "font-hack-nerd-font" "font-hack-nerd-font" "" "homebrew/cask-fonts"
brew_install "Menlo for Powerline" "font-menlo-for-powerline" "" "homebrew/cask-fonts"
