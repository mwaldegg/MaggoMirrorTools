#!/bin/bash
# Script to turn on /off mirror by hue motion sensor over zigbee2mqtt -> openhab rest api
# openhab thing: http://openhab:8080/rest/items/Hue_Motion01_motion

# Add cronjob:
# @reboot sleep 60 && /home/pi/MaggoMirrorTools/hue_motion_mirror.sh >> /home/pi/hue_motion_mirror.log 2>&1

#clear logfile
test -f /home/pi/hue_motion_mirror.log && > /home/pi/hue_motion_mirror.log

echo -n "$(date): "
echo "startup: $0 $@"

ONTIME_DEFAULT=300

#check if alternative ONTIME set in parameter $1
if [ -z "$1" ]; then
  ONTIME=$ONTIME_DEFAULT
else
  ONTIME=$1
  echo sleeptime set from call parameter: $ONTIME
fi

[ -n "$ONTIME" ] && [ "$ONTIME" -eq "$ONTIME" ] 2>/dev/null
if [ $? -ne 0 ]; then
   #$ONTIME no valid number / set do default
   echo "Parameter: $1 is not a valid numer! usinge default ($ONTIME_DEFAULT)"
   ONTIME=$ONTIME_DEFAULT
fi

laststate="on"

while [ 1 -eq 1 ]
  do
  motion=$(wget -qO- http://openhab:8080/rest/items/Hue_Motion01_motion/state)
  echo -n "$(date): "
  echo MOTION=$motion
  if [ $(echo $motion) == "ON" ]; then
    echo "Motion detected: $motion"
    if [ $laststate == "off" ]; then
      echo "Turning on Mirror"
      wget -qO- 'http://localhost:8080/remote?action=MONITORON' > /dev/null 2>&1 #Enable MagicMirror
    fi
    laststate="on"
    echo "Sleeping for $ONTIME sec..."
    sleep $ONTIME
  else
    echo "No motion detected"
    if [ $laststate == "on" ]; then
      echo "Turning off Mirror"
    wget -qO- 'http://localhost:8080/remote?action=MONITOROFF' > /dev/null 2>&1 #Disable MagicMirror
    fi
    laststate="off"
    sleep 5
  fi

done
