#!/usr/bin/env sh
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Disable terminal bleep in tty.
grep -q "blacklist pcspkr" /etc/modprobe.d/blacklist.conf || echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

# Fix for loss of networking after desktop install
# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/9079
ln -sf "$SCRIPT_DIR"/etc/conf.d/networking /etc/conf.d/networking

apk list mate-desktop --installed | grep installed > /dev/null || setup-desktop mate

install_brisk_menu () {
    wget --quiet https://mark.gerarts.be/alpine/brisk-menu-0.6.2-r0.apk
    apk add ./brisk-menu-0.6.2-r0.apk
    rm brisk-menu-0.6.2-r0.apk
}

apk list brisk-menu --installed | grep installed > /dev/null || install_brisk_menu

# Set up APK and install packages.
# WORLD is overwritten on apk operations, so a symlink won't work. This
# means that this file has to be kept up-to-date manually.
cat "$SCRIPT_DIR"/etc/apk/world /etc/apk/world | sort | uniq > "$SCRIPT_DIR"/etc/apk/world.tmp
mv "$SCRIPT_DIR"/etc/apk/world.tmp "$SCRIPT_DIR"/etc/apk/world
cp "$SCRIPT_DIR/etc/apk/world" /etc/apk/world
ln -sf "$SCRIPT_DIR/etc/apk/repositories" /etc/apk/repositories
apk add

# Don't make networking blocking on boot.
sed -i 's/iface wlan0 inet dhcp/# iface wlan0 inet dhcp/' /etc/network/interfaces
sed -i 's/iface eth0 inet dhcp/# iface eth0 inet dhcp/' /etc/network/interfaces
rc-update -q add dhcpcd default

# Enable bluetooth.
rc-update -q add bluetooth default

# Make bash the default shell.
chsh mark --shell /bin/bash

# Enable docker
rc-update -q add docker default

# Set up flatpak.
su mark -c 'flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
su mark -c 'flatpak --user install -y md.obsidian.Obsidian'
su mark -c 'flatpak --user install -y it.mijorus.smile -y'

# Set up autologin for lightdm
cp "$SCRIPT_DIR/etc/lightdm/lightdm.conf" /etc/lightdm/lightdm.conf

# Configure qwerty-fr
sh "$SCRIPT_DIR/qwerty-fr.sh"

# Make reboot/poweroff not require a pass
cp "$SCRIPT_DIR/etc/doas.d/doas.conf" /etc/doas.d/doas.conf

# Set up NetworkManager
if [ ! -f /etc/NetworkManager/NetworkManager.conf ]; then
    adduser mark plugdev
    cp "$SCRIPT_DIR"/etc/NetworkManager/conf.d/any-user.conf /etc/NetworkManager/conf.d/any-user.conf
    cp "$SCRIPT_DIR"/etc/NetworkManager/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf
    rc-service -q networking stop
    rc-service -q wpa_supplicant stop
    rc-update -q add networkmanager default
    rc-update -q del networking boot
    rc-update -q del wpa_supplicant boot
    echo "NetworkManager is freshly installed, activate network connections using nmtui or the panel"
fi

# For the ideapad (current laptop): disable nouveau.
if [ ! -f /etc/modprobe.d/blacklist-nouveau.conf ]; then
    cp "$SCRIPT_DIR"/etc/modprobe.d/blacklist-nouveau.conf /etc/modprobe.d/blacklist-nouveau.conf
    mkinitfs
fi

# Set up some wallpapers
if [ ! -d /usr/share/backgrounds/ubuntu-mate-common ]; then
    git clone https://github.com/ubuntu-mate/ubuntu-mate-artwork
    cp -r ubuntu-mate-artwork/usr /
    rm -rf ubuntu-mate-artwork
fi
