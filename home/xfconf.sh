#!/usr/bin/env sh

# When updating settings, use the following commands to find out what to add to
# this config. We don't use the channel XML files because they contain
# device-specific properties and a lot of defaults we aren't interested in.
#
# To list channels:
#
#   xfconf-query -l
#
# To list settings within a channel:
#
#   xfconf-query -c keyboards -l -v
#
# To monitor which properties are changed when editing them in the settings UI:
#
#   xfconf-query -c xfce4-panel -m
#
# Or check ~/.config/xfce4/xfconf/xfce-perchannel/*.xml

xfconf-query -c keyboards -p /Default/Numlock --create --type bool --set "true"

xfconf-query -c thunar -p /last-show-hidden --create --type bool --set "true"
xfconf-query -c thunar -p /last-view --create --type string --set "ThunarDetailsView"

xfconf-query -c xfce4-desktop -p /desktop-icons/style --create --type int --set "0"

xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/brightness-switch --create --type int --set "0"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/brightness-switch-restore-on-exit --create --type int --set "1"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/general-notification --create --type bool --set "false"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode --create --type bool --set "false"
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/show-tray-icon --create --type bool --set "false"

xfconf-query -c xfce4-screensaver -p /saver/idle-activation/delay --create --type int --set "20"
xfconf-query -c xfce4-screensaver -p /saver/mode --create --type int --set "0"

xfconf-query -c xfce4-terminal -p /color-background --create --type string --set "#2c2c2c"
xfconf-query -c xfce4-terminal -p /color-background-vary --create --type bool --set "false"
xfconf-query -c xfce4-terminal -p /color-bold --create --type string --set ""
xfconf-query -c xfce4-terminal -p /color-bold-is-bright --create --type bool --set "true"
xfconf-query -c xfce4-terminal -p /color-bold-use-default --create --type bool --set "true"
xfconf-query -c xfce4-terminal -p /color-cursor --create --type string --set "#dcdcdc"
xfconf-query -c xfce4-terminal -p /color-cursor-foreground --create --type string --set ""
xfconf-query -c xfce4-terminal -p /color-cursor-use-default --create --type bool --set "true"
xfconf-query -c xfce4-terminal -p /color-foreground --create --type string --set "#dcdcdc"
xfconf-query -c xfce4-terminal -p /color-palette --create --type string \
  --set "#3f3f3f;#705050;#60b48a;#dfaf8f;#9ab8d7;#dc8cc3;#8cd0d3;#dcdcdc;#709080;#dca3a3;#72d5a3;#f0dfaf;#94bff3;#ec93d3;#93e0e3;#ffffff"
xfconf-query -c xfce4-terminal -p /color-selection --create --type string --set ""
xfconf-query -c xfce4-terminal -p /color-selection-background --create --type string --set ""
xfconf-query -c xfce4-terminal -p /color-selection-use-default --create --type bool --set "true"
xfconf-query -c xfce4-terminal -p /color-use-theme --create --type bool --set "false"
xfconf-query -c xfce4-terminal -p /font-name --create --type string --set "Monospace 14"
xfconf-query -c xfce4-terminal -p /misc-cursor-blinks --create --type bool --set "true"
xfconf-query -c xfce4-terminal -p /misc-show-unsafe-paste-dialog --create --type bool --set "false"
xfconf-query -c xfce4-terminal -p /scrolling-lines --create --type string --set "10000"
xfconf-query -c xfce4-terminal -p /scrolling-unlimited --create --type bool --set "false"
xfconf-query -c xfce4-terminal -p /tab-activity-color --create --type string --set "#aa0000"

xfconf-query -c xfwm4 -p /general/borderless_maximize --create --type bool --set "true"
xfconf-query -c xfwm4 -p /general/click_to_focus --create --type bool --set "true"
xfconf-query -c xfwm4 -p /general/move_opacity --create --type int --set "100"
xfconf-query -c xfwm4 -p /general/placement_mode --create --type string --set "center"
xfconf-query -c xfwm4 -p /general/placement_ratio --create --type int --set "100"
xfconf-query -c xfwm4 -p /general/snap_to_border --create --type bool --set "true"
xfconf-query -c xfwm4 -p /general/titleless_maximize --create --type bool --set "true"
xfconf-query -c xfwm4 -p /general/workspace_count --create --type int --set "1"

xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/override" --create --type bool --set "true"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>f" --create --type string --set "thunar"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Alt>t" --create --type string --set "exo-open --launch TerminalEmulator"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Shift><Alt>Escape" --create --type string --set "xfce4-popup-whiskermenu"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary><Shift>Escape" --create --type string --set "xfce4-taskmanager"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/Print" --create --type string --set "xfce4-screenshooter"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Shift>Print" --create --type string --set "xfce4-screenshooter -r"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>e" --create --type string --set "thunar"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>l" --create --type string --set "xflock4"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>p" --create --type string --set "xfce4-display-settings --minimal"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>r" --create --type string --set "xfce4-appfinder -c"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt><Shift>Tab" --create --type string --set "cycle_reverse_windows_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Alt>Tab" --create --type string --set "cycle_windows_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/override" --create --type bool --set "true"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Down" --create --type string --set "tile_down_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Left" --create --type string --set "tile_left_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Right" --create --type string --set "tile_right_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>Up" --create --type string --set "maximize_window_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>d" --create --type string --set "show_desktop_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Primary>period" --create --type string --set "flatpak run it.mijorus.smile"

xfconf-query -c xsettings -p /Net/IconThemeName --create --type string --set "Rodent"

xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Acceleration --create --type double --set "5"
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Properties/libinput_Tapping_Enabled --create --type int --set "1"
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/ReverseScrolling --create --type bool --set "true"
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/RightHanded --create --type bool --set "true"
xfconf-query -c pointers -p /SynPS2_Synaptics_TouchPad/Threshold --create --type int --set "1"

# Panel configuration is a bit messy...
xfconf-query -c xfce4-panel -p /plugins/plugin-1 --create --type string --set "power-manager-plugin"
xfconf-query -c xfce4-panel -p /plugins/plugin-11 --create --type string --set "showdesktop"
xfconf-query -c xfce4-panel -p /plugins/plugin-12 --create --type string --set "separator"
xfconf-query -c xfce4-panel -p /plugins/plugin-13 --create --type string --set "launcher"
xfconf-query -c xfce4-panel -p /plugins/plugin-14 --create --type string --set "launcher"
xfconf-query -c xfce4-panel -p /plugins/plugin-15 --create --type string --set "launcher"
xfconf-query -c xfce4-panel -p /plugins/plugin-16 --create --type string --set "launcher"
xfconf-query -c xfce4-panel -p /plugins/plugin-13/items --create --type string --set "17665143651.desktop" --force-array
xfconf-query -c xfce4-panel -p /plugins/plugin-14/items --create --type string --set "17665143652.desktop" --force-array
xfconf-query -c xfce4-panel -p /plugins/plugin-15/items --create --type string --set "17665143653.desktop" --force-array
xfconf-query -c xfce4-panel -p /plugins/plugin-16/items --create --type string --set "17665143654.desktop" --force-array
xfconf-query -c xfce4-panel -p /plugins/plugin-17 --create --type string --set "separator"
xfconf-query -c xfce4-panel -p /plugins/plugin-18 --create --type string --set "directorymenu"
xfconf-query -c xfce4-panel -p /plugins/plugin-18/base-directory --create --type string --set "/home/mark"
xfconf-query -c xfce4-panel -p /plugins/plugin-19 --create --type string --set "whiskermenu"
xfconf-query -c xfce4-panel -p /plugins/plugin-2 --create --type string --set "tasklist"
xfconf-query -c xfce4-panel -p /plugins/plugin-2/grouping --create --type int --set "1"
xfconf-query -c xfce4-panel -p /plugins/plugin-3 --create --type string --set "separator"
xfconf-query -c xfce4-panel -p /plugins/plugin-3/expand --create --type bool --set "true"
xfconf-query -c xfce4-panel -p /plugins/plugin-3/style --create --type int --set "0"
xfconf-query -c xfce4-panel -p /plugins/plugin-4 --create --type string --set "pulseaudio"
xfconf-query -c xfce4-panel -p /plugins/plugin-4/enable-keyboard-shortcuts --create --type bool --set "true"
xfconf-query -c xfce4-panel -p /plugins/plugin-4/known-players --create --type string --set "firefox"
xfconf-query -c xfce4-panel -p /plugins/plugin-6 --create --type string --set "systray"
xfconf-query -c xfce4-panel -p /plugins/plugin-6/known-items --create --type string --set "blueman" --force-array
xfconf-query -c xfce4-panel -p /plugins/plugin-6/square-icons --create --type bool --set "true"
xfconf-query -c xfce4-panel -p /plugins/plugin-8 --create --type string --set "clock"
xfconf-query -c xfce4-panel -p /plugins/plugin-9 --create --type string --set "separator"
xfconf-query -c xfce4-panel -p /plugins/plugin-9/style --create --type int --set "0"
xfconf-query -c xfce4-panel -p /panels/dark-mode --create --type bool --set "true"
xfconf-query -c xfce4-panel -p /panels/panel-1/autohide-behavior --create --type int --set "0"
xfconf-query -c xfce4-panel -p /panels/panel-1/background-style --create --type int --set "0"
xfconf-query -c xfce4-panel -p /panels/panel-1/icon-size --create --type int --set "16"
xfconf-query -c xfce4-panel -p /panels/panel-1/length --create --type int --set "100"
xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids --create \
  --type int --set 19 \
  --type int --set 2 \
  --type int --set 3 \
  --type int --set 6 \
  --type int --set 4 \
  --type int --set 1 \
  --type int --set 9 \
  --type int --set 8
xfconf-query -c xfce4-panel -p /panels/panel-1/position --create --type string --set "p=6;x=0;y=0"
xfconf-query -c xfce4-panel -p /panels/panel-1/position-locked --create --type bool --set "true"
xfconf-query -c xfce4-panel -p /panels/panel-1/size --create --type int --set "26"
xfconf-query -c xfce4-panel -p /panels/panel-2/autohide-behavior --create --type int --set "1"
xfconf-query -c xfce4-panel -p /panels/panel-2/length --create --type int --set "1"
xfconf-query -c xfce4-panel -p /panels/panel-2/plugin-ids --create \
  --type int --set 11 \
  --type int --set 12 \
  --type int --set 13 \
  --type int --set 14 \
  --type int --set 15 \
  --type int --set 16 \
  --type int --set 17 \
  --type int --set 18
xfconf-query -c xfce4-panel -p /panels/panel-2/position --create --type string --set "p=10;x=0;y=0"
xfconf-query -c xfce4-panel -p /panels/panel-2/position-locked --create --type bool --set "true"
xfconf-query -c xfce4-panel -p /panels/panel-2/size --create --type int --set "48"
xfconf-query -c xfce4-panel -p /panels --create --type int --set "1"  --type int --set "2"
