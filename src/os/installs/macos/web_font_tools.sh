#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# print_in_purple "\n   Web Font Tools\n\n"

# removing these fonts - CL tools are too outdated
# brew_install "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "" "bramstein/webfonttools"
# brew_install "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "" "bramstein/webfonttools"
# brew_install "Web Font Tools: WOFF2" "woff2" "" "bramstein/webfonttools"

print_in_purple "\n   Fonts\n\n"
brew_install "freetype fonts" "freetype"
brew_install "Meslo Nerd Font for Powerlevel10K" "font-meslo-for-powerlevel10k"
# brew_install "MesloLG Nerd Font Families (Meslo LG)" "font-meslo-lg-nerd-font"
brew_install "JetBrains Mono" "font-jetbrains-mono"
brew_install "JetBrains Mono Nerd Font Families" "font-jetbrains-mono-nerd-font"