#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   iTerm\n\n"

# Force iTerm to check ~/.dotfiles/.iTerm2 directory for configuration
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.dotfiles/src/os/preferences/macos/iterm2"

execute "defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true" \
    "Force iTerm2 to check ~/.dotfiles/iterm2 directory for configuration"

execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
    "Don't display the annoying prompt when quitting iTerm2" 

# execute "exec sh ${HOME}/.dotfiles/src/os/preferences/macos/iterm2/materialshell-dark.itermcolors" \
#    "Install Material Theme for iTerm2" 


