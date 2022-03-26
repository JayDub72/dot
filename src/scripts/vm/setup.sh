#!/bin/bash

# set timezone
sudo timedatectl set-timezone America/Chicago

# add user to sudo
sudo usermod -aG sudo ${USER}

# make sure updates are all complete
sudo apt-get update && sudo apt-get upgrade -y

# install ZSH
sudo apt-get -y install zsh zsh-syntax-highlighting zsh-autosuggestions
chsh -s $(which zsh)

sudo apt-get -y install zsh-theme-powerlevel9k
exec $(which zsh)

echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

zsh -l