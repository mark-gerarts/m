# Nix / NixOS configuration

A very much WIP set of configuration files for my Nix/NixOS setup. The `/m`
setup is inspired by [burke/b](https://github.com/burke/b).

## Installation

First, do a regular (minimal) install of NixOS. Then clone this repository into
`/m` and symlink all config from here. All the following stuff could be just a
script I guess, but for now it's copy-paste.

Cloning the repo:

```bash
$ sudo mkdir /m
$ sudo chown mark:users /m
$ cd /m
$ git clone git@github.com:mark-gerarts/m.git .
```

Setting up NixOS:

```bash
$ sudo rm /etc/nixos/configuration.nix
$ sudo cp /etc/nixos/hardware-configuration.nix /m/nixos/
$ sudo ln -s /m/nixos/configuration.nix /etc/nixos/configuration.nix
```

Copy the correct configuration for current the device:

```bash
$ ln -s /m/nixos/device-specific-configuration.nix.pc.dist /m/nixos/device-specific-configuration.nix
```

Home manager setup (move the install of home-manager to configuration.nix):

```bash
$ # Mind the release number
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable # For some specific packages from unstable
$ nix-channel --update # Log out and in after this command
$ nix-shell '<home-manager>' -A install
$ rm -r ~/.config/nixpkgs/
$ ln -s /m/nix ~/.config/nixpkgs
$ home-manager switch
```

Dotfiles (move these to home manager?):

```bash
$ # Or create a script to symlink them?
$ cp -r /m/home/ /home/mark/
```

## VSCode

Install dictionaries for SpellRight:

```bash
$ ln -s /home/mark/.nix-profile/share/hunspell/* ~/.config/Code/Dictionaries
```

Additional languages are provided in the hunspellDicts.\* packages.

## Gnome config

@todo: check if we can put this in nix config as well (dconf)

- Caps lock -> ctrl
- Enable/configure extensions in tweak tool
- Shortcut for terminal
- Shortcut for win+e (launchers -> home folder)
- Set nautilus to use list view, folders before files
- Terminal settings (tab alt+l/r, color, font size, ...)
