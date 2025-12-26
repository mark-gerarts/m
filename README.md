# Desktop Configurations

Configuration files for my desktop. The `/m` setup is inspired by
[burke/b](https://github.com/burke/b). I use NixOS for my primary devices, and
Alpine for low-specced machines.

## NixOS

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

Copy the correct configuration for current device:

```bash
$ ln -s /m/nixos/device-specific-configuration.nix.pc.dist /m/nixos/device-specific-configuration.nix
```

Switch to the new config:

```bash
$ nixos-rebuild switch
```

Set up dotfiles (creates symlinks):

```bash
$ /m/home/setup.sh
```

## Alpine

TODO: further document installation/initial setup.

Install Alpine using `setup-alpine` using `cryptsys` for the disk. Reboot into the root user
and get SSH keys onto the device.

```bash
# apk add git
# mkdir /m
# chown mark:mark /m
# su mark
$ cd /m
$ git clone git@github.com/mark-gerarts/m.git .
```

Set up the system:

```bash
doas /m/alpine/setup.sh
```

Setting up dotfiles is identical to NixOS:

```bash
$ /m/home/setup.sh
```
