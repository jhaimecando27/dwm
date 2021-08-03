# TODO

1. [autostart-20210120-cb3f58a](https://dwm.suckless.org/patches/autostart/)
3. [activetagindicatorbar-6.2](https://dwm.suckless.org/patches/activetagindicatorbar/)
4. [alternativetags-6.2](https://dwm.suckless.org/patches/alternativetags/)
5. [fullgaps-20200508-7b77734](https://dwm.suckless.org/patches/fullgaps/)
6. [systray-20210418-67d76bd](https://dwm.suckless.org/patches/systray/)
7. [fibonacci-20200418-c82db69](https://dwm.suckless.org/patches/fibonacci/)
8. [cyclelayouts-20180524-6.2](https://dwm.suckless.org/patches/cyclelayouts/)
9. [r1615-selfrestart](https://dwm.suckless.org/patches/selfrestart/)


# Scratch

## Installation 
- Download or clone the repo and store it at `~/.local/share/` so it can read the autostart file. You can also change the location of the autostart file by changing the value of `localshare[]` at dwm.c file, so you change the directory of dwm rather than at `~/.local/share/`. Check [doc](https://dwm.suckless.org/patches/autostart/) of autostart patch for more information.
```sh
git clone https://github.com/jhaimecando27/dwm.git ~/.local/share/dwm
cd ~/.local/share/dwm/
sudo make clean install
```

### Running dwm
This build of dwm will be available in a login manager after installation. Below is the `dwm.desktop` that will be located at `/usr/share/xsessions/`:
```
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
```

Else you can add the following line in your `.xinitrc`
```
exec dwm
```

## Autostart file
This build is patch in a way that the `autostart.sh` can be located at the dwm's directory at `~/.local/share/dwm`. For more information see the [autostart file](https://github.com/jhaimecando27/dwm/blob/main/autostart.sh) or the [doc](https://dwm.suckless.org/patches/autostart/) about the patch.

## Optional Dependencies
You can also install this following apps that related to my build.
- [st](https://dwm.suckless.org/) - check my build of [st](https://github.com/jhaimecando27/st)
- [dmenu](https://tools.suckless.org/dmenu/)
- xfce4-notifyd
- polkit-gnome
- nitrogen
