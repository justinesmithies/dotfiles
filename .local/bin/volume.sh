#!/bin/bash

volume="$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))%"

	if [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" == "100" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "89" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "100" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "79" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "90" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "69" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "80" ]]; then
		icon=" 墳"
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "59" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "70" ]]; then
		icon=" 墳"
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "49" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "60" ]]; then
		icon=" 墳"
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "39" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "50" ]]; then
		icon=" 墳"
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "29" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "40" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "19" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "30" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -ge "9" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "20" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -gt "0" && "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -le "10" ]]; then
		icon=" "
	elif [[ "$(awk -F"[]%[]" '/Left:/ { print $2 }' <(amixer sget Master))" -eq "0" ]]; then
		icon=" 婢"
		volume=" M "
	fi


if [[ "$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))" == "off" ]]; then
		icon=" 婢"
		volume=" M "
fi

printf "%s" "$icon $volume"
