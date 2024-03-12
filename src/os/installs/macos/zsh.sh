#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   ZSH\n\n"

# brew_install "zsh shell" "zsh"
brew_install "zsh syntax highlighting" "zsh-syntax-highlighting"
brew_install "zsh autosuggestions" "zsh-autosuggestions"
brew_install "zsh completions" "zsh-completions"

print_in_purple "\n   Powerlevel10k\n\n"

brew_install "Powerlevel10K" "powerlevel10k"
