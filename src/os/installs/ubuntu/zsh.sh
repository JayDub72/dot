#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   ZSH\n\n"

install_package "ZSH" "zsh zsh-syntax-highlighting zsh-autosuggestions"

execute "sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"" \
    "Installing Oh My Zsh"

execute "git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k" \
    "Installing Powerlevel10K"
    
execute "sleep 1" "change default shell"
# hack until error fixed -- Password: chsh: PAM: Authentication failure
chsh -s $(which zsh)

