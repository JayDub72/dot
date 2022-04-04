#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Force iTerm to check ~/.dotfiles/.iTerm2 directory for configuration
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.dotfiles/src/os/preferences/macos/iterm2"
execute "defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true" \
    "Force iTerm2 to check ~/.dotfiles/iterm2 directory for configuration"

execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
    "Don't display the annoying prompt when quitting iTerm2" 

execute  "/usr/libexec/PlistBuddy -c "set \"New Bookmarks\":0:\"Custom Directory\" Recycle" ~/Library/Preferences/com.googlecode.iterm2.plist" \
    "Make iTerm2 load new tabs in the same directory"

execute "exec sh ${HOME}/.dotfiles/src/os/preferences/iterm2/material-design-colors.itermcolors" \
    "Install Material Theme for iTerm2" 


