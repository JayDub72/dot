#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Image Tools\n\n"

brew_install "(GIMP, GNU Image Manipulation Program) Free and open-source image editor" "gimp" 
brew_install "Utility to reduce the size of 24-bit PNG files" "imagealpha"
brew_install "Tools and libraries to manipulate images in many formats" "imagemagick"
brew_install "Tool to optimise images to a smaller size" "imageoptim" 
