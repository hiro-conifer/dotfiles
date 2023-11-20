#!/usr/bin/env bash

menu=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i -b -p powermenu --dmenu --width 300 --lines=7 --style=${HOME}/.config/wofi/style.css --conf=${HOME}/.config/wofi/powermenu.conf | awk '{print tolower($2)}' )

case $menu in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $menu
                ;;
        lock)
            	~/.config/sway/scripts/swaylock.sh
                ;;
        logout)
                swaymsg exit
                ;;
esac
