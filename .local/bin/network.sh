#!/bin/bash

# This script requires dnsutils aka bind to fetch the WAN IP address

# Shows the connections names
# nmcli connection show --active | grep 'ethernet' | awk '{ print $1 }' FS='  '
# nmcli connection show --active | grep 'wifi' | awk '{ print $1 }' FS='  '

# Show ethernet interface name
# nmcli connection show --active | grep 'ethernet' | awk '{ print $6 }' FS=' '

# Show wifi interface name
# nmcli connection show --active | grep 'wifi' | awk '{ print $4 }' FS=' '

function ShowInfo {
	if [ "$(nmcli connection show --active | grep -oh "\w*ethernet\w*")" == "ethernet" ]; then
		wan="$(dig +short myip.opendns.com @resolver1.opendns.com)"
		connection="$(nmcli connection show --active | grep 'ethernet' | awk '{ print $6 }' FS=' '): $(nmcli connection show --active | grep 'ethernet' | awk '{ print $1 }' FS='  ') - $(nmcli -t -f IP4.ADDRESS dev show $(nmcli connection show --active | grep 'ethernet' | awk '{ print $6 }' FS=' ') | awk '{print $2}' FS='[:/]')
WAN IP: $wan"
	elif [ "$(nmcli connection show --active | grep -oh "\w*wifi\w*")" == "wifi" ]; then
		wan="$(dig +short myip.opendns.com @resolver1.opendns.com)"
		connection="$(nmcli connection show --active | grep 'wifi' | awk '{ print $4 }' FS=' '): $(nmcli connection show --active | grep 'wifi' | awk '{ print $1 }' FS='  ') - $(nmcli -t -f IP4.ADDRESS dev show $(nmcli connection show --active | grep 'wifi' | awk '{ print $4 }' FS=' ') | awk '{print $2}' FS='[:/]')
WAN IP: $wan"
	else
		connection="No active connection."
	fi
	dunstify -i "network-idle" "$connection" -r 123
}

function IconUpdate() {
	if [ "$(nmcli connection show --active | grep -oh "\w*ethernet\w*")" == "ethernet" ]; then
		icon="  "
	elif [ "$(nmcli connection show --active | grep -oh "\w*wifi\w*")" == "wifi" ]; then
		icon="  "
	else
		icon="  "
	fi
	printf "%s" "$icon"
}

if [ $1 = "ShowInfo" ]; then
	ShowInfo
else
	IconUpdate	
fi

