#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dock\n\n"

execute "defaults write com.apple.dock orientation -string bottom" \
    "Move dock to the left side of the screen"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.dock autohide-delay -float 0" \
    "Disable the hide Dock delay"

execute "defaults write com.apple.dock autohide-time-modifier -int 0" \
    "CHange autohide timer to 0 seconds"    

execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write com.apple.dock expose-animation-duration -float 0.1" \
    "Make all Mission Control related animations faster."

execute "defaults write com.apple.dock expose-group-by-app -bool false" \
    "Do not group windows by application in Mission Control"

execute "defaults write com.apple.dock launchanim -bool false" \
    "Disable the opening of an application from the Dock animations."

execute "defaults write com.apple.dock mineffect -string 'scale'" \
    "Change minimize/maximize window effect"

execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock persistent-apps -array && \
         defaults write com.apple.dock persistent-others -array " \
    "Wipe all app icons"

execute "defaults write com.apple.Dock showhidden -bool TRUE && killall Dock" \
    "Make hidden apps transparent in the dock"
    
execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

execute "defaults write com.apple.dock show-recents -bool false" \
    "Do not show recent applications in Dock"

execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

execute "defaults write com.apple.dock hide-mirror -bool true" \
    "Make Dock more transparent"

execute "defaults write com.apple.dock tilesize -int 36" \
    "Set icon size"

execute "defaults write com.apple.dock wvous-tr-corner -int 0" \
    "Disable top right hot corner"

execute "defaults write com.apple.dock wvous-tl-corner -int 0" \
    "Disable top left hot corner"

execute "defaults write com.apple.dock wvous-bl-corner -int 0" \
    "Disable bottom left hot corner"

execute "defaults write com.apple.dock wvous-br-corner -int 5" \
    "Enable bottom right hot corner for Screen Save"

# remove all existing icons from the dock
execute "dockutil -r all" \
    "Clearing dock incons"

# add preferred icons to the dock
execute "dockutil --add /Applications/Safari.app/" \
    "Add Safari to the dock"

execute "dockutil --add /Applications/Firefox.app/" \
    "Add Firefox to the dock"

execute "dockutil --add /Applications/iTerm.app/" \
    "Add iTerm to the dock"

execute "dockutil --add /System/Applications/Messages.app/" \
    "Add Messages to the dock"

execute "dockutil --add /Applications/Notion.app/" \
    "Add Notion to the dock"

execute "dockutil --add /Applications/Obsidian.app/" \
    "Add Obsidian to the dock"

execute "Spotify --add /Applications/Spotify.app/" \
    "Add Spotify to the dock"

execute "dockutil --add /Applications/VSCodium.app/" \
    "Add VS Codium to the dock"

execute "dockutil --add /Applications --view grid --display folder --sort name --section others --allhomes" \
    "Add Applications to the dock"

execute "dockutil --add ~/Documents --view list --display folder --sort name --section others --allhomes" \
    "Add Documents to the dock"

execute "dockutil --add ~/Downloads --view list --display folder --sort name --section others --allhomes" \
    "Add Downloads to the dock"

execute "killall "Dock" &> /dev/null
    "Restart the dock"
