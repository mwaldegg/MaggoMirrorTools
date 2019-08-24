#!/bin/bash
# Script to turn on /off mirror by hacked yi cam motion
# https://github.com/mwaldegg/yi-hack

# Add cronjob:
# @reboot sleep 60 && /home/pi/MaggoMirrorTools/yi_motion_mirror.sh >> /home/pi/yi_motion_mirror.log 2>&1


laststate="on"

while [ 1 -eq 1 ]
do

	motion=$(wget -qO- http://192.168.200.152/motion)

	if [ -z "$motion" ]; then
		echo "No motion detected"
        	if [ $laststate == "on" ]; then
            		echo "Turning off Mirror"
           		wget -qO- 'http://localhost:8080/remote?action=MONITOROFF' > /dev/null 2>&1 #Disable MagicMirror
        	fi
        	laststate="off"
		sleep 4
	else
		echo "Motion detected: $motion"
		if [ $laststate == "off" ]; then
			echo "Turning on Mirror"
			wget -qO- 'http://localhost:8080/remote?action=MONITORON' > /dev/null 2>&1 #Enable MagicMirror
		fi
		laststate="on"
		echo "Sleeping..."
		sleep 600
	fi

done
