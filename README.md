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
$ sudo ln -s /m/nixos/configuration.nix /etc/nixos/configuration.nix
```

*TODO*: the above doesn't quite work due to hardware-configuration.nix. Either change the PATH or copy the hardware config?

Home manager setup (move the install of home-manager to configuration.nix):

```
$ # Mind the release number
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update
$ nix-shell '<home-manager>' -A install
$ rm -r ~/.config/nixpkgs/
$ ln -s /m/nix ~/.config/nixpkgs
$ home-manager switch
```

Dotfiles (move these to home manager?):

```
$ rm -r ~/.xmonad
$ ln -s /m/home/.xmonad ~/

$ # Or create a script to symlink them?
$ cp -r /m/home/ /home/mark/
```
