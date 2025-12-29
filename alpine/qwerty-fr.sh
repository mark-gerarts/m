#!/usr/bin/env sh
set -e

# There doesn't seem to be a clean way to install this at the moment... We
# download the symbols file and autostart it with setxkbmap.
if [ ! -f "/usr/share/X11/xkb/symbols/us_qwerty-fr" ]; then
    wget -q https://raw.githubusercontent.com/qwerty-fr/qwerty-fr/master/linux/us_qwerty-fr \
        -O /usr/share/X11/xkb/symbols/us_qwerty-fr

    mkdir -p /home/mark/.config/autostart
    cat <<EOF > /home/mark/.config/autostart/qwerty-fr.desktop
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=setxkbmap
Comment=
TryExec=setxkbmap
Exec=setxkbmap us_qwerty-fr
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
EOF

    chown -R mark:mark /home/mark/.config
fi
