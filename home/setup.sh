#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlinks() {
    dirs=(
        ".ssh"
        ".config/Code/User"
        ".config/bat"
        ".config/autostart"
        ".pulsar"
        ".local/bin"
    )

    for dir in "${dirs[@]}"; do
        [ ! -d "$HOME/$dir" ] && mkdir -p "$HOME/$dir"
    done

    files=(
        ".bashrc"
        ".eslintrc.json"
        ".ssh/config"
        ".config/Code/User/settings.json"
        ".config/Code/User/keybindings.json"
        ".config/bat/config"
        ".config/autostart/xcape.desktop"
        ".gitconfig"
        ".pylintrc"
        ".vimrc"
        ".sbclrc"
        ".pulsar/config.cson"
        ".pulsar/keymap.cson"
        ".local/bin/copy"
        ".local/bin/paste"
        ".local/bin/spp"
        ".local/bin/mksh"
        ".local/bin/bs"
    )

    for file in "${files[@]}"; do
        ln -sf "$SCRIPT_DIR/$file" "$HOME/$file"
    done

    # Also add .profile for some other distros
    ln -sf "$SCRIPT_DIR/.bashrc" "$HOME/.profile"
}

setup_vscode() {
    if code -v &> /dev/null; then
        # Get any extensions that are part of the repo but not yet installed, and install them.
        INSTALLED_EXTENSIONS=$(code --list-extensions | sort)
        ALL_EXTENSIONS=$(sort "$SCRIPT_DIR/.config/Code/User/extensions.list")
        EXTENSIONS_TO_INSTALL=$(comm -13 <(echo "$INSTALLED_EXTENSIONS") <(echo "$ALL_EXTENSIONS"))
        [ -n "${EXTENSIONS_TO_INSTALL// }" ] && echo "$EXTENSIONS_TO_INSTALL" | xargs -n 1 code --install-extension

        # Update the extensions list if there are any extensions installed but not yet part of the repo.
        code --list-extensions > "$SCRIPT_DIR/.config/Code/User/extensions.list"
    fi
}

setup_xfce() {
    if ! command -v xfconf-query >/dev/null 2>&1
    then
        echo "xfconf-query is not installed, skipping xfce4 setup"
    else
        ./xfconf.sh
    fi
}

create_symlinks
setup_vscode
setup_xfce
