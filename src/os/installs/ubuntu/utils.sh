#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {

    wget -qO - "$1" | sudo apt-key add - &> /dev/null
    #     │└─ write output to file
    #     └─ don't show output

}

add_ppa() {
    sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
    sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
}

autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed.

    execute \
        "sudo apt-get autoremove -qqy" \
        "APT (autoremove)"

}

install_package() {

    declare -r EXTRA_ARGUMENTS="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo apt-get install --allow-unauthenticated -qqy $EXTRA_ARGUMENTS $PACKAGE" "$PACKAGE_READABLE_NAME"
        #                                      suppress output ─┘│
        #            assume "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

install_oh-my-zsh() {
    
    export ZSH=~/.oh-my-zsh

    if [ ! -d $ZSH ]; then
        git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
    fi

    ZSH_THEME_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    
    if [ ! -d "$ZSH_THEME_DIR" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_THEME_DIR"
    fi

}
package_is_installed() {
    dpkg -s "$1" &> /dev/null
}

update() {

    # Resynchronize the package index files from their sources.

    execute \
        "sudo apt-get update -qqy" \
        "APT (update)"

}

upgrade() {

    # Install the newest versions of all packages installed.

    execute \
        "export DEBIAN_FRONTEND=\"noninteractive\" \
            && sudo apt-get -o Dpkg::Options::=\"--force-confnew\" upgrade -qqy" \
        "APT (upgrade)"

}
