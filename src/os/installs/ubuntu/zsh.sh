#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   ZSH\n\n"

install_package "ZSH" "zsh zsh-syntax-highlighting zsh-autosuggestions"

print_in_purple "\n   Changing default shell to zsh\n\n"

chsh -s $(which zsh)

print_in_purple "\n   Powerlevel9k\n\n"

install_package "Powerlevel9K" "zsh-theme-powerlevel9k"

print_in_purple "\n   Running shell for detault config\n\n"

exec $(which zsh)

print_in_purple "\n   Update config\n\n"

echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
