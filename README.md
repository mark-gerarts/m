# Nix / NixOS configuration

A very much WIP set of configuration files for my Nix/NixOS setup.

## Installation

On a fresh install:

Create a directory `/m`

```
$ nix-env -f '<nixpkgs>' -iA home-manager
$ rm -r ~/.config/nixpkgs/
$ ln -s /m/nix ~/.config/nixpkgs
$ home-manager switch
```
