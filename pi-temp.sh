#!/bin/bash
# Script: my-pi-temp.sh
# Purpose: Display the ARM CPU and GPU  temperature of Raspberry Pi 2/3 
# Author: Vivek Gite <www.cyberciti.biz> under GPL v2.x+
# -------------------------------------------------------
cpu=$(echo "scale=1;$(</sys/class/thermal/thermal_zone0/temp)/1000" | bc )
gpu=$(/opt/vc/bin/vcgencmd measure_temp | cut -d"=" -f2 | cut -d "'" -f1)
echo "$(date) @ $(hostname)"
echo "-------------------------------------------"
echo "GPU : $gpu"
echo "CPU : $cpu"
