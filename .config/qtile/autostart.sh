#!/bin/sh

# Sutostart script for Qtile

# Set functions

# Functions

cmd_exist() { unalias "$1" >/dev/null 2>&1 ; command -v "$1" >/dev/null 2>&1 ;}
__kill() { kill -9 "$(pidof "$1")" >/dev/null 2>&1 ; }
__start() { sleep 1 && "$@" >/dev/null 2>&1 & }
__running() { pidof "$1" >/dev/null 2>&1 ;}

# Set the wallpaper    
#feh --bg-fill /home/justine/Pictures/Wallpapers/deer_art_vector_134088_3840x2160.jpg &

nitrogen --restore &

# Apps to autostart
if cmd_exist picom ; then
    __kill picom
    __start picom
fi

# Authentication dialog

if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
    __kill polkit-gnome-authentication-agent-1
    __start /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
fi

# Notification daemon

if cmd_exist dunst ; then
    __kill dunst
    __start dunst
fi

# Wallpaper manager

if cmd_exist nitrogen ; then
    __kill nitrogen
    __start nitrogen --restore
fi

# Network manager

#if cmd_exist nm-applet ; then
    #__kill nm-applet
    #__start nm-applet
#fi
