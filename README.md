![dwm](https://github.com/jhaimecando27/dwm/assets/74945153/498a6d26-a77a-4b5f-86f4-b5c7c7d8eb83)

<sub><sup>image from [suckless](https://suckless.org/)</sup></sub>

# DWM - Dynamic Window Manager

# Table of Contents

- [Introduction](#introduction)
- [Patches Installed](#patches-installed)
- [Requirements](#requirements)
- [Installation](#installation)
- [Running DWM](#running)
- [Adding Autostart](#autostart)
- [Config Reference](#reference)

# <a name="introduction">Introduction</a>

dwm is a dynamic window manager for X created by [suckless](https://suckless.org/). It manages windows in tiled, monocle, and floating layouts. All of the layouts can be applied dynamically, optimizing the environment for the application in use and the task performed. More information is at [dwm's webpage](https://dwm.suckless.org/).

This is my personal build of DWM, which aims to be not too minimal like the default build by applying a number of [patches](https://dwm.suckless.org/patches/) that are helpful for daily use.

# <a name="patches-installed">Patches Installed</a>

- [dwm-autostart-20161205-bb3bd6f.diff](https://dwm.suckless.org/patches/autostart/)
- [dwm-systray-20230922-9f88553.diff](https://dwm.suckless.org/patches/systray/)
- [dwm-exitmenu-6.3.diff](https://dwm.suckless.org/patches/exitmenu/)
    - [dwm-restartsig-20180523-6.2.diff](https://dwm.suckless.org/patches/restartsig/)

# <a name="requirements">Requirements</a> [^1][^2]

- Xlib header files:
    - x11
    - xft
    - xinerama
  
# <a name="installation">Installation</a> [^1]

The repo needs to be placed at a specific location for autostart to work specifically ```$XDG_DATA_HOME/dwm```, ```$HOME/.local/share/dwm```, or ```$HOME/.dwm```. 

I personally place it at ```$HOME/.local/share/```. Read more about DWM's [autostart patch](https://dwm.suckless.org/patches/autostart/) for more options or configurations.
```bash
git clone https://github.com/jhaimecando27/dwm.git ~/.local/share
cd ~/.local/share/dwm
sudo make install
```

# <a name="running">Running DWM</a>

## Method 1: .xinitrc [^1]

```bash
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1
done &
exec dwm
```

## Method 2: login screen [^3]

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

# <a name="autostart">Autostart</a> [^4]

The installed autostart patch looks for ```autostart.sh``` and ```blocking_autostart.sh``` at dwm's directory.
> [!NOTE]
> The file must be executable to work ```chmod +x <file>```
## autostart.sh examples:
### Example 1 [^3]
```bash
#! /bin/bash
picom &
nitrogen --restore &
dwmblocks &
```
### Example 2 [^5]
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

# <a name="reference">Config Reference</a>
- [Derek Taylor](https://gitlab.com/dwt1)'s dwm build - [dwm-distrotube](https://gitlab.com/dwt1/dwm-distrotube)
- [arcolinux](https://github.com/arcolinux)'s dwm build - [arco-dwm](https://github.com/arcolinux/arcolinux-dwm/tree/master/etc/skel/.config/arco-dwm)

[^1]: https://git.suckless.org/dwm/file/README.html
[^2]: https://faun.pub/the-easiest-way-to-install-dwm-43bbf668ea83
[^3]: https://gitlab.com/dwt1/dwm-distrotube
[^4]: https://dwm.suckless.org/patches/autostart/
[^5]: https://github.com/arcolinux/arcolinux-dwm/blob/master/etc/skel/.config/arco-dwm/autostart.sh
