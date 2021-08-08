#!/usr/bin/env bash

function run {
    if ! pgrep $1 ; then
        $@&
    fi
}

run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "nitrogen --restore"
