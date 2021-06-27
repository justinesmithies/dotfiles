#!/bin/bash

function IconUpdate() {
if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Discharging" ]]; then
	if [[ "$(cat /sys/class/power_supply/BAT0/capacity)" == "100" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "89" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "100" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "79" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "90" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "69" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "80" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "59" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "70" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "49" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "60" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "39" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "50" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "29" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "40" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "19" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "30" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "9" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "20" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "0" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "10" ]]; then
		icon=""
	fi
fi
if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ]]; then
	if [[ "$(cat /sys/class/power_supply/BAT0/capacity)" == "100" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "89" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "100" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "79" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "90" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "69" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "80" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "59" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "70" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "49" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "60" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "39" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "50" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "29" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "40" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "29" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "30" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "9" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "20" ]]; then
		icon=""
	elif [[ "$(cat /sys/class/power_supply/BAT0/capacity)" -ge "0" && "$(cat /sys/class/power_supply/BAT0/capacity)" -le "10" ]]; then
		icon=""
	fi
fi

if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Full" ]]; then
		icon=""
fi

if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Unknown" ]]; then
		icon=""
fi
capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
printf "%s" "$icon $capacity%"
}

if [ $1 = "ShowInfo" ]; then
	ShowInfo
else
	IconUpdate	
fi
