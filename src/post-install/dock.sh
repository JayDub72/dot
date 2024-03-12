#!/bin/sh

# remove all existing icons from the dock
dockutil -r all

# add preferred icons to the dock
dockutil --add /Applications/Safari.app/
dockutil --add /Applications/Firefox.app/
dockutil --add /Applications/iTerm.app/
dockutil --add /Applications/Notion.app/
dockutil --add /Applications/Spotify.app/
dockutil --add /System/Applications/Messages.app/
dockutil --add /Applications/VSCodium.app/
dockutil --add /Applications --view grid --display folder --sort name --section others --allhomes
dockutil --add ~/Documents --view list --display folder --sort name --section others --allhomes
dockutil --add ~/Downloads --view list --display folder --sort name --section others --allhomes
