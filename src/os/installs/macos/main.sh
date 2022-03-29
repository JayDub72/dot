#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./zsh.sh
./git.sh
./apps.sh
./browsers.sh
./image_tools.sh
./video_tools.sh
./vscode.sh
./web_font_tools.sh
