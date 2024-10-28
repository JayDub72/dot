#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Git\n\n"

brew_install "Distributed revision control system" "git"
brew_install "mall git utilities" "git-extras"
brew_install "Git extension for versioning large files" "git-lfs"
brew_install "Extensions to follow Vincent Driessen's branching model" "git-flow"
brew_install "GitHub command-line tool" "gh"
