#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlinks() {
    [ -d "$HOME/.scripts" ] && rm -r "$HOME/.scripts"
    ln -sf "$SCRIPT_DIR/.scripts" "$HOME/.scripts"

    dirs=(
        ".ssh"
        ".config/Code/User"
        ".pulsar"
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
        ".config/bat"
        ".gitconfig"
        ".pylintrc"
        ".vimrc"
        ".sbclrc"
        ".pulsar/config.cson"
        ".pulsar/keymap.cson"
    )

    for file in "${files[@]}"; do
        ln -sf "$SCRIPT_DIR/$file" "$HOME/$file"
    done
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

create_symlinks
setup_vscode
