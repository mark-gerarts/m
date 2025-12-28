#!/usr/bin/env sh
set -e

# TODO: get script dir in an sh-compatible way.
SCRIPT_DIR=/m/alpine

# Disable terminal bleep in tty.
grep -q "blacklist pcspkr" /etc/modprobe.d/blacklist.conf || echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf

# Fix for loss of networking after xfce install
# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/9079
ln -sf "$SCRIPT_DIR"/etc/conf.d/networking /etc/conf.d/networking

# Install xfce4 if needed.
apk list xfce4 --installed | grep installed > /dev/null || setup-desktop xfce

# Set up APK and install packages.
# WORLD is overwritten on apk operations, so a symlink won't work. This
# means that this file has to be kept up-to-date manually.
cat "$SCRIPT_DIR"/etc/apk/world /etc/apk/world | sort | uniq > "$SCRIPT_DIR"/etc/apk/world
cp "$SCRIPT_DIR/etc/apk/world" /etc/apk/world
ln -sf "$SCRIPT_DIR/etc/apk/repositories" /etc/apk/repositories
apk add

# Don't make networking blocking on boot.
sed -i 's/iface wlan0 inet dhcp/# iface wlan0 inet dhcp/' /etc/network/interfaces
sed -i 's/iface eth0 inet dhcp/# iface eth0 inet dhcp/' /etc/network/interfaces
rc-update add dhcpcd default

# Enable bluetooth.
rc-update add bluetooth default

# Make bash the default shell.
chsh mark --shel /bin/bash

# Set up flatpak.
su mark -c 'flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo'

# TODO: install qwerty-fr and/or package it
