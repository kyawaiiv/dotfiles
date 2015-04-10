#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load OS X color profile
xcalib "~/.colorprofiles/Color LCD-6BE19EEB-A027-0135-289F-617ADCFEBA7C.icc"

# Set root background with feh
sh ~/.fehbg &

# Set default cursor
xsetroot -cursor_name left_ptr

# Source ~/.Xresources
xrdb -merge ~/.Xresources

# Start rxvt-unicode daemon
/usr/bin/urxvtd -q -f -o

# Start sxhkd
sxhkd &

# Start unagi
unagi &

# Set up BSPWM FIFO & launch BSPWM
export PANEL_FIFO="/tmp/panel-fifo"
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
exec bspwm
