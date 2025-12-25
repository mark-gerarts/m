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
#  xfconf-query -c keyboards -l -v
#
# Or check /.config/xfce4/xfconf/xfce-perchannel/*.xml

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

# Terminal shortcuts are not part of xfconf yet, unfortunately.
sed -i 's|; (gtk_accel_path "<Actions>/terminal-window/next-tab" "")|(gtk_accel_path "<Actions>/terminal-window/next-tab" "<Alt>Right"))|' ~/.config/xfce4/terminal/accels.scm
sed -i 's|; (gtk_accel_path "<Actions>/terminal-window/prev-tab" "")|(gtk_accel_path "<Actions>/terminal-window/prev-tab" "<Alt>Left"))|' ~/.config/xfce4/terminal/accels.scm
