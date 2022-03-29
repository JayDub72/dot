#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {
    execute "/opt/homebrew/bin/code --install-extension $2" "$1 (plugin)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"                                :

# Install VSCode
brew_install "Visual Studio Code" "visual-studio-code" "--cask"

printf "\n"

# Install the VSCode plugins
# install_plugin "EditorConfig" "EditorConfig.EditorConfig"
# install_plugin "MarkdownLint" "DavidAnson.vscode-markdownlint"
# install_plugin "Vim" "vscodevim.vim"
install_plugin "Docker" "ms-azuretools.vscode-docker"
install_plugin "Material Icon Theme" "ms-azuretools.vscode-docker"
install_plugin "Material Product Icons" "ms-azuretools.vscode-docker"
install_plugin "File Icons" "vscode-icons-team.vscode-icons"
install_plugin "Material Theme" "zhuangtongfa.material-theme"


# Close VSCode
osascript -e 'quit app "Visual Studio Code"'
