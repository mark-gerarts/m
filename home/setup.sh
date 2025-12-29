#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlinks() {
    echo "Symlinking dotfiles..."

    dirs=(
        ".ssh"
        ".config/VSCodium/User"
        ".config/bat"
        ".config/autostart"
        ".config/xfce4/panel"
        ".config/xfce4/terminal"
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
        ".config/VSCodium/User/settings.json"
        ".config/VSCodium/User/keybindings.json"
        ".config/bat/config"
        ".config/autostart/xcape.desktop"
        ".config/xfce4/terminal/accels.scm"
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

    # For xfce's settings, we just copy instead (symlinking borks).
    cp -r "$SCRIPT_DIR/.config/xfce4/panel" "$HOME/.config/xfce4"

    # TODO: if kate proves a replacement for vscode, port its settings over:
    # ~/.config/kate
    # ~/.local/share/kxmlgui5/katepart
}

setup_vscode() {
    if codium -v &> /dev/null; then
        echo "Syncing VSCodium extensions..."

        # Get any extensions that are part of the repo but not yet installed, and install them.
        INSTALLED_EXTENSIONS=$(codium --list-extensions | sort)
        ALL_EXTENSIONS=$(sort "$SCRIPT_DIR/.config/VSCodium/User/extensions.list")
        EXTENSIONS_TO_INSTALL=$(comm -13 <(echo "$INSTALLED_EXTENSIONS") <(echo "$ALL_EXTENSIONS"))
        [ -n "${EXTENSIONS_TO_INSTALL// }" ] && echo "$EXTENSIONS_TO_INSTALL" | xargs -n 1 codium --install-extension

        # Update the extensions list if there are any extensions installed but not yet part of the repo.
        codium --list-extensions > "$SCRIPT_DIR/.config/VSCodium/User/extensions.list"
    else
        echo "VSCodium is not installed, skipping."
    fi
}

setup_xfce() {
    if ! command -v xfconf-query >/dev/null 2>&1
    then
        echo "xfconf-query is not installed, skipping xfce4 setup"
    else
        echo "Configuring xfce..."
        "$SCRIPT_DIR/xfconf.sh"
    fi
}

# Java is needed for ltex, but can be tricky because NixOS requires
# special treatment.
setup_java_home() {
    echo "Configuring Java"

    mkdir -p "$HOME/.local/lib"
    rm -f "$HOME/.local/lib/jvm"

    # Check if a default JVM exists, otherwise assume NixOS.
    if [ -d "/usr/lib/jvm/default-jvm/" ]; then
        ln -sf /usr/lib/jvm/default-jvm "$HOME/.local/lib/jvm"
    else
        ln -sf /run/current-system/sw/lib/openjdk "HOME/.local/lib/jvm"
    fi
}

create_symlinks
setup_java_home
setup_vscode
setup_xfce

echo "Done!"
