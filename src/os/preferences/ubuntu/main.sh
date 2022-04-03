#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ./privacy.sh
# ./terminal.sh
# ./ui_and_ux.sh

execute "sudo timedatectl set-timezone America/Chicago" \
    "Set timezone"
    