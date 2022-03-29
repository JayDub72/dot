#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_homebrew_git_config_file_path() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get config file path)"
        return 1
    fi

}

install_homebrew() {

    if ! cmd_exists "brew"; then
        # ask_for_sudo
        # printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
        #  └─ simulate the ENTER keypress
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
    fi

    print_result $? "Homebrew"

}

opt_out_of_analytics() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Try to get the path of the `Homebrew` git config file.

    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Opt-out of Homebrew's analytics.
    # https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out

    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
        print_result $? "Homebrew (opt-out of analytics)"
    fi

}

opt_out_of_auto_update() {

    declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If needed, add the necessary configs in the
    # local shell configuration file.

    if ! grep "HOMEBREW_NO_AUTO_UPDATE" < "$LOCAL_SHELL_CONFIG_FILE" &> /dev/null; then

        declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Configure Homebrew to not auto-update before running commands
# such as: \`brew install\`, \`brew upgrade\`, and \`brew tap\`.
#
# https://docs.brew.sh/Manpage#environment

export HOMEBREW_NO_AUTO_UPDATE=1
"
        execute \
            "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE" \
            "Homebrew (opt-out of auto-updating before running certain commands)"
    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Homebrew\n\n"

    install_homebrew
    opt_out_of_analytics

    brew_update
    brew_upgrade

    brew_install "bat" "bat"
    brew_install "coreutils" "coreutils"
    brew_install "curl" "curl"
    brew_install "findutils" "findutils"
    brew_install "gawk" "gawk"
    brew_install "grc" "grc"
    brew_install "grep" "grep"
    brew_install "java" "java"
    brew_install "libtool" "libtool"
    brew_install "moreutils" "moreutils"
    brew_install "neofetch" "neofetch"
    brew_install "nmap" "nmap"
    brew_install "openssh" "openSSH"
    brew_install "psgrep" "psgrep"
    brew_install "pv" "pv"
    brew_install "p7zip" "p7zip"
    brew_install "rename" "rename"
    brew_install "rlwrap" "rlwrap"
    brew_install "ssh-copy-id" "ssh-copy-id"
    brew_install "svn" "svn"
    brew_install "trash" "trash"
    brew_install "tree" "tree"
    brew_install "wget" "wget"
    brew_install "xz" "xz"
    brew_install "zopfli" "zopfli"

    # Mac Utilities
    brew_install "dockutil" "dockutil"
    brew_install "duti" "duti"
}

main
