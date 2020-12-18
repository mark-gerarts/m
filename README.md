# Nix / NixOS configuration

A very much WIP set of configuration files for my Nix/NixOS setup. The `/m` setup is inspired by [burke/b](https://github.com/burke/b).

## Installation

I clone this directory into `/m` and symlink all config from here. All the following stuff could be just a script I guess, but for now it's copy-paste.

Cloning the repo:

```
$ sudo mkdir /m
$ sudo chown mark:users /m
$ cd /m
$ git clone git@github.com:mark-gerarts/m.git .
```

Setting up NixOS:

```
$ sudo rm /etc/nixos/configuration.nix
$ sudo cp /etc/nixos/hardware-configuration.nix /m/nixos/
$ sudo ln -s /m/nixos/configuration.nix /etc/nixos/configuration.nix
```

Copy the correct configuration for current the device:

```
$ ln -s /m/nixos/device-specific-configuration.nix.pc.dist /m/nixos/device-specific-configuration.nix
```

Home manager setup (move the install of home-manager to configuration.nix):

```
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

```
$ # Or create a script to symlink them?
$ cp -r /m/home/ /home/mark/
```

## KDE config

- Autostart: add insync & xkbmap script
