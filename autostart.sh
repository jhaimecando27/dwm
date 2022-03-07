#!/usr/bin/env bash

function run {
    if ! pgrep $1  
    then
        $@&
    fi
}

# Systray
run "nm-applet"
run "volumeicon"
run "pamac-tray"
run "xfce4-power-manager"

# System
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
dwmstatus &

# Theme
feh --bg-fill -z ~/Pictures/Wallpapers/arcolinux/* &
picom -b  --config ~/.config/arco-dwm/picom.conf &
