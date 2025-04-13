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

## Gnome config

Some things that are not poured in a script yet.

- Gnome terminal
  - Profile > color scheme; disable limit scrollback
  - Font size
  - Shortcuts: Alt+Left/Right for Previous/Next tab
- Settings
  - Multitasking
    - Disable hot corner
    - Enable Active screen edges
  - Keyboard
    - Change input source to qwerty-fr ([steps](https://github.com/qwerty-fr/qwerty-fr/issues/49#issuecomment-1405254634))
    - Shortcuts
      - Win+E Home folder
      - Ctr-Alt-T gnome-terminal custom shortcut
      - Alt+Tab Switch windows
  - Apps > Default apps (e.g. firefox, image viewer, ...)
- Gnome tweaks
  - Keyboard > Additional Layout Options > Caps Lock as Ctrl
  - Windows > Titlebar Buttons: Maximize and Minimize
- Dash-to-dock
  - Icon size 32
  - Show trash can: disabled
  - Window counter indicators: dots
