# Nix / NixOS configuration

A very much WIP set of configuration files for my Nix/NixOS setup. The `/m` setup is inspired by [burke/b](https://github.com/burke/b).

## Installation

I clone this directory into `/m` and symlink all config from here. 

Cloning the repo:

```
$ sudo mkdir /m
$ sudo chown mark:mark /m
$ cd /m
$ git clone git@github.com:mark-gerarts/m.git .
```

All the following stuff could be just a script I guess, but for now it's copy-paste.

Home manager setup:

```
$ nix-env -f '<nixpkgs>' -iA home-manager
$ rm -r ~/.config/nixpkgs/
$ ln -s /m/nix ~/.config/nixpkgs
$ home-manager switch
```

Dotfiles (move these to home manager?):

```
$ ln -s /m/home/.xmonad
```
