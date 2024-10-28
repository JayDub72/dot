#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   ZSH\n\n"

# brew_install "zsh shell" "zsh"
brew_install "Fish-like fast/unobtrusive autosuggestions for zsh" "zsh-autosuggestions"
brew_install "Additional completion definitions for zshs" "zsh-completions"
brew_install "Fish shell like syntax highlighting for zsh" "zsh-syntax-highlighting"

print_in_purple "\n   Powerlevel10k\n\n"

brew_install "Powerlevel10K theme for zsh" "powerlevel10k"
