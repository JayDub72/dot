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

    brew_install "Clone of cat(1) with syntax highlighting and Git integration" "bat"
    brew_install "GNU File, Shell, and Text utilities" "coreutils"
    brew_install "Get a file from an HTTP, HTTPS or FTP server" "curl"
    brew_install "Modern, maintained replacement for ls" "eza"
    brew_install "Collection of GNU find, xargs, and locate" "findutils"
    brew_install "Command-line fuzzy finder written in Go" "fzf"
    # brew_install "GNU awk utility" "gawk" # not sure this is needed anymore
    brew_install "Colorize logfiles and command output" "grc"
    brew_install "GNU grep, egrep and fgrep" "grep"
    # brew_install "java" "java" # not sure this is needed anymore
    # brew_install "libtool" "libtool" # not sure this is needed anymore
    brew_install "Collection of tools that nobody wrote when UNIX was young" "moreutils"
    brew_install "Fast, highly customisable system info script" "neofetch"
    brew_install "Port scanning utility for large networks" "nmap"
    brew_install "OpenBSD freely-licensed SSH connectivity tools" "openSSH"
    brew_install "7-Zip (high compression file archiver) implementation" "p7zip"
    brew_install "Shortcut for the 'ps aux | grep' idiom" "psgrep"
    # brew_install "pv" "pv" # not sure this is needed anymore
    brew_install "Perl-powered file rename script with many helpful built-ins" "rename"
    # brew_install "rlwrap" "rlwrap" # not sure this is needed anymore
    brew_install "Add a public key to a remote machine's authorized_keys file" "ssh-copy-id"
    # brew_install "svn" "svn" # not sure this is needed anymore
    brew_install "CLI tool that moves files or folder to the trash" "trash"
    brew_install "Display directories as trees (with optional color/HTML output)" "tree"
    brew_install "Internet file retriever" "wget"
    # brew_install "xz" "xz" # not sure this is needed anymore
    brew_install "New zlib (gzip, deflate) compatible compressor" "zopfli"

    # Mac Utilities
    brew_install "Tool for managing dock items" "dockutil"
    brew_install "Select default apps for documents and URL schemes on macOS" "duti"
    brew_install "Perl lib for reading and writing EXIF metadata" "exiftool"

    # RPG tools
    brew_install Utility to convert 5eTools and Pf2eTools JSON data into Markdown" "ttrrpg-convert-cli"
}

main
