#!/bin/bash

# Calendar script

function ShowCalendar() {
	dunstify -i "calendar"  "    📅 Calendar" "$(cal --color=always | sed "s/..7m/<b><span color=\"blue\">/;s/..27m/<\/span><\/b>/")" -r 124
}

function EditCalendar() {
  echo 
}

case "$1" in
        show)
            ShowCalendar
            ;;
         
        edit)
            EditCalendar
            ;;
         
        *)
            echo $"Usage: ${0##*/} {show|edit}"
            exit 1
 
esac
