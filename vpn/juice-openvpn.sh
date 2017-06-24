#!/bin/bash

scriptversion="0.1.0"
serverlist="/tmp/serverlist.txt"

# Save prompt settings, OpenVPN tends to brick the prompt
sttysettings=$(stty -g)

trap ctrl_c INT

# In case ctrl+c is pressed, restore terminal color and prompt settings, then exit
function ctrl_c ()
{
	echo
	echo "Exiting script..."
	echo
	tput sgr0
	stty $sttysettings
	exit 0
}

# Function to show usage (available switches)
function showhelp()
{
	echo "- Available switches:"
	echo "  $0 -h = Show help"
	echo "  $0 -d = Daemonize OpenVPN"
	echo "  $0 -s = Shows OpenVPN status & IP"
	echo "  $0 -u = Updates this script"
	echo
	tput bold
	echo "- This script requires the following packages:"
	echo "  curl, openvpn, wget, dialog"
	echo
	tput sgr0
}

# Function to check external IP
function checkip()
{
	ip=""
	attempt=0
	while [ "$ip" = "" ]; do
	        attempt=$(($attempt+1))
	        ip=`curl http://geoip.hmageo.com/ip/ 2>/dev/null`
	        if [ "$ip" != "" ]; then
	            if [ ! "$1" == "silent" ] ; then echo "- Current IP: $ip" ; fi
	        fi
	        if [ $attempt -gt 3 ]; then
	            if [ ! "$1" == "silent" ] ; then echo "- Failed to check current IP address." ; fi
	                exit
	        fi
	done
}

# If no su privileges available, try to get them
if [[ ! "$(whoami)" == "root" ]] ; then
	echo -e "\nJuice VPN Script v$scriptversion"

	# No sudo available? Then we can't get su privs. Advise and exit
	if [[ $(which sudo) == "" ]] ; then
		echo "'sudo' package missing! Please install."
		echo "e.g.: apt-get install sudo"
		exit 1
	fi

	echo "Requesting su permissions..."
	# Run this script with sudo privs
	sudo $0 $*
		# If running this script with su privs failed, advise to do so manually and exit
		if [[ $? > 0 ]] ; then
		echo
		echo "Acquiring su permission failed!"
		echo "Please run this script with sudo permissions!"
		echo "(e.g. 'sudo $0' or 'sudo bash $0')"
		echo
		exit 1
	fi
exit 0
fi

# Check for which parameters this script was run with, act accordingly
while getopts "tfdhsu" parm
do
        case $parm in
	f)      pingtest connect
		;;

	t)	pingtest
		;;

        d)      daemonize=1
                ;;
	s)	if [ -z "$(pidof openvpn)" ] ; then
			echo -e "\n- OpenVPN is not running!"
		else
			echo -e "\n- OpenVPN is running."
		fi
		checkip
		echo
		exit 0
		;;
        ?)      echo -e "\nJuice VPN Script v$scriptversion"
		echo -e "==================\n"
		showhelp
		exit 0
		;;
        esac
done


showtitle() {
clear
green="\e[36;5;82m"
stdcol="\e[0m"
echo -e "\n$green =============================="
echo " |      _       _             |"
echo " |     | |_   _(_) ___ ___    |"
echo " |  _  | | | | | |/ __/ _ \   |"
echo " | | |_| | |_| | | (_|  __/   |"
echo " |  \___/ \__,_|_|\___\___|   |"
echo " | Juice VPN Script v$scriptversion     |"
echo -e " ==============================\n"
echo "-> https://vpn.juiceboxdata.com"
}

showtitle
showhelp

# Check what package managers are available, yum or apt-get. If both, use apt-get
pkgmgr=""
if [[ ! $(which yum) == "" ]] ; then
	pkgmgr="yum install"
fi
if [[ ! $(which apt-get) == "" ]] ; then
	pkgmgr="apt-get install"
fi

# Function to check for and install needed packages
function checkpkg
{
	if [[ $(which $1) == "" ]] ; then
		echo -n "Package '$1' not found! Attempt installation? (y/n) "
		read -n1 answer
		echo
		case $answer in
			y) $pkgmgr $1
			;;
			n) echo -n "Proceed anyway? (y/n) "
			read -n1 answer2
			echo
			if [[ "$answer2" == "n" ]] ; then exit
			fi
			;;
		esac
	fi
}

# Check for all needed packages
checkpkg curl
checkpkg wget
checkpkg openvpn
checkpkg dialog
checkpkg fping

clear

showtitle
checkip
sleep 1

echo -e "\n- Starting OpenVPN connection to:"
echo -e "  (Please enter your VPN account username and password when asked)\n"

sleep 1

# If we're supposed to run as daemon, run OpenVPN in daemon mode as well
if [ "$daemonize" == "1" ]; then
openvpn --daemon --script-security 3 --config ~/client.ovpn
echo -n -e "\n - Waiting for connection process to complete.."
sleep 5

oldip=$ip
ipattempt=0
while [ "$ipattempt" -lt "5" ]; do
	ipattempt=$(($ipattempt+1))
	echo -n "."
	checkip silent
	if [ ! "$ip" == "$oldip" ] ; then
		echo -e "\n - IP has changed ($oldip -> $ip)"
		echo "   Connection successful."
		ipattempt=5
	fi
	sleep 5
done

if [ "$ip" == "$oldip" ] ; then
echo -e "\nIP has not changed! Please check for possible network problems."
killall openvpn 2>/dev/null
ctrl_c
fi

echo -e "\nDisconnect via: 'sudo killall openvpn'\n"
else

# If we're not supposed to run as daemon, run OpenVPN the normal way
openvpn --script-security 3 --config ~/client.ovpn
fi

# Exit script
ctrl_c

