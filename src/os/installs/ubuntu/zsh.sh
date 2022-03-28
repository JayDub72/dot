#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   ZSH\n\n"

install_package "ZSH" "zsh zsh-syntax-highlighting zsh-autosuggestions"

print_in_purple "\n   Powerlevel9k\n\n"

install_package "Powerlevel9K" "zsh-theme-powerlevel9k"

execute "sleep 1" "change default shell"
# hack until error fixed -- Password: chsh: PAM: Authentication failure
# exec $(which zsh)

