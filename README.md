![dwm](https://github.com/jhaimecando27/dwm/assets/74945153/498a6d26-a77a-4b5f-86f4-b5c7c7d8eb83)

<sub><sup>image from [suckless](https://suckless.org/)</sup></sub>

# DWM - Dynamic Window Manager

## Table of Contents

- [Introduction](#introduction)
- [Patches Installed](#patches-installed)
- [Requirements](#requirements-12)
- [Installation](#installation-1)
- [Running DWM](#running-dwm)
- [Autostart](#autostart-4)
- [Optional Configuration](#optional-configuration)
- [Other DWM build](#other-dwm-build)

## Introduction

dwm is a dynamic window manager for X created by [suckless](https://suckless.org/). It manages windows in tiled, monocle, and floating layouts. All of the layouts can be applied dynamically, optimizing the environment for the application in use and the task performed. More information is at [dwm's webpage](https://dwm.suckless.org/).

This is my personal build of DWM, which aims to be not too minimal like the default build by applying a number of [patches](https://dwm.suckless.org/patches/) that are helpful for daily use.

## Patches Installed

- [dwm-autostart-20161205-bb3bd6f.diff](https://dwm.suckless.org/patches/autostart/)
- [dwm-systray-20230922-9f88553.diff](https://dwm.suckless.org/patches/systray/)
- [dwm-exitmenu-6.3.diff](https://dwm.suckless.org/patches/exitmenu/)
    - [dwm-restartsig-20180523-6.2.diff](https://dwm.suckless.org/patches/restartsig/)

## Requirements [^1][^2]

- Xlib header files:
    - x11
    - xft
    - xinerama
  
## Installation [^1]

The repo needs to be placed at a specific location for autostart to work specifically ```$XDG_DATA_HOME/dwm```, ```$HOME/.local/share/dwm```, or ```$HOME/.dwm```. 

I personally place it at ```$HOME/.local/share/```. Read more about DWM's [autostart patch](https://dwm.suckless.org/patches/autostart/) for more options or configurations.
```bash
git clone https://github.com/jhaimecando27/dwm.git ~/.local/share
cd ~/.local/share/dwm
sudo make install
```

## Running DWM

### Method 1: .xinitrc [^1]

```bash
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1
done &
exec dwm
```

### Method 2: login screen [^3]

Create a ```dwm.desktop``` at ```/usr/share/xsessions``` with the content below:

```bash
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
```

## Autostart [^4]

The installed autostart patch looks for ```autostart.sh``` and ```blocking_autostart.sh``` at dwm's directory.
> [!NOTE]
> The file must be executable to work ```chmod +x <file>```
### autostart.sh examples:
#### Example 1 [^3]
```bash
#! /bin/bash
picom &
nitrogen --restore &
dwmblocks &
```
#### Example 2 [^5]
```bash
#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
run "nm-applet"
run "pamac-tray"
run "variety"
run "xfce4-power-manager"
run "blueberry-tray"
```

## Optional Configuration
### Touch-pad[^6]
Create a file ```/etc/X11/xorg.conf.d/30-touchpad.conf``` that contains this:
>[!NOTE]
>Need to restart Xorg afterwards
```conf
Section "InputClass"
    Identifier "touchpad catchall"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
```

### Systray[^5]
- nm-applet
- xfce4-power-manager
- volume-icon
- blueberry-tray

### Other Utilities

- Suckless' utilities
  - [dmenu - dynamic menu for X](https://tools.suckless.org/dmenu/)
  - [st - simple terminal](https://st.suckless.org/)
  - [slock - Simple X display locker](https://tools.suckless.org/slock/)
  - [slstatus - status monitor for window managers](https://tools.suckless.org/slstatus/)
- polkit-gnome-authentication-agent-1
- libnotiy
- [auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq) - Automatic CPU speed & power optimizer for Linux.

## Other DWM build
- [Derek Taylor](https://gitlab.com/dwt1)'s dwm build - [dwm-distrotube](https://gitlab.com/dwt1/dwm-distrotube)
- [arcolinux](https://github.com/arcolinux)'s dwm build - [arco-dwm](https://github.com/arcolinux/arcolinux-dwm/tree/master/etc/skel/.config/arco-dwm)

[^1]: https://git.suckless.org/dwm/file/README.html
[^2]: https://faun.pub/the-easiest-way-to-install-dwm-43bbf668ea83
[^3]: https://gitlab.com/dwt1/dwm-distrotube
[^4]: https://dwm.suckless.org/patches/autostart/
[^5]: https://github.com/arcolinux/arcolinux-dwm/blob/master/etc/skel/.config/arco-dwm/autostart.sh
[^6]: https://superuser.com/questions/1528211/enabling-touchpad-tapping-after-installing-dwm-on-arch-linux
