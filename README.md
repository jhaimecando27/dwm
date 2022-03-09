# Jam's dwm (6.2)

## About
dwm is an extremely fast, small, and dynamic window manager for X created by [suckless guys](https://suckless.org/). This is my personal build of dwm that include number of patches installed and some minor tweaks to add some bling.

## Patches Installed
1. [autostart-20210120-cb3f58a](https://dwm.suckless.org/patches/autostart/)
3. [activetagindicatorbar-6.2](https://dwm.suckless.org/patches/activetagindicatorbar/)
4. [alternativetags-6.2](https://dwm.suckless.org/patches/alternativetags/)
5. [fullgaps-20200508-7b77734](https://dwm.suckless.org/patches/fullgaps/)
6. [systray-20210418-67d76bd](https://dwm.suckless.org/patches/systray/)
7. [tcl](http://dwm.suckless.org/patches/three-column/)
 
## Requirements
- Xlib header files

## Installation 
- Store the repo at `~/.local/src/`, [here's why](https://unix.stackexchange.com/questions/10814/what-is-the-usr-local-src-folder-meant-for).
```sh
git clone https://github.com/jhaimecando27/dwm.git ~/.local/share/dwm
cd ~/.local/share/dwm/
sudo make clean install
```

### Running dwm
By default, dwm will **not** be available in a login manager after installation. Below is the format for `dwm.desktop` that should be located at `/usr/share/xsessions/`:
```
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
```
Else if you don't have a login manager, then you can add the following line below in your `.xinitrc`.
```
exec dwm
```

## Recommendation
You can also install this following app/s that would be helpful.
- [st](https://dwm.suckless.org/) - Check my build of [st](https://github.com/jhaimecando27/st)
- [dmenu](https://tools.suckless.org/dmenu/)
- [status monitor](http://dwm.suckless.org/status_monitor/) - Check my build of [dwmstatus](https://github.com/jhaimecando27/dwmstatus)
- xfce4-notifyd 
- polkit-gnome 

###### END
- Check [suckless website](https://dwm.suckless.org/) for more information about dwm
