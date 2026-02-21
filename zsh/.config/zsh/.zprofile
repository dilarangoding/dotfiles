
export XDG_DATA_DIRS="/usr/local/share:/usr/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] ; then
   exec sway
fi
