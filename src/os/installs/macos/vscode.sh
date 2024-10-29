#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {
    execute "/opt/homebrew/bin/codium --install-extension $2" "$1 (plugin)"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"                                :

# Install VSCode
brew_install "Binary releases of VS Code without MS branding/telemetry/licensing" "vscodium"

printf "\n"

# Install the VSCode plugins
# install_plugin "EditorConfig" "EditorConfig.EditorConfig"
# install_plugin "MarkdownLint" "DavidAnson.vscode-markdownlint"
# install_plugin "Vim" "vscodevim.vim"
install_plugin "Catppuccin Theme" "catppuccin.catppuccin-vsc"
install_plugin "Catppuccin Icons" "catppuccin.catppuccin-vsc-icons"
install_plugin "Docker" "ms-azuretools.vscode-docker"
install_plugin "File Icons" "vscode-icons-team.vscode-icons"
install_plugin "Material Theme" "zhuangtongfa.material-theme"
install_plugin "Material Icon Theme" "pkief.material-icon-theme"
install_plugin "Material Product Icons" "pkief.material-product-icons"
install_plugin "NIX Flake Formatter" "jnoortheen.nix-ide"
install_plugin "Terraform Formatter" "hashicorp.terraform"
install_plugin "YAML Formatter" "redhat.vscode-yaml"

# Close VSCode
osascript -e 'quit app "Visual Studio Codium"'
