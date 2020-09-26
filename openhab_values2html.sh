#!/bin/bash

#Wohnzimmer
t_wz=$(curl -L  http://openhab:8080/rest/items/hmip_temp_livingroom/state)
h_wz=$(curl -L  http://openhab:8080/rest/items/hmip_humi_livingroom/state)

#Bad
t_bad=$(curl -L  http://openhab:8080/rest/items/hmip_temp_bathroom/state)
h_bad=$(curl -L  http://openhab:8080/rest/items/hmip_humi_bathroom/state)

#Schlafzimmer:
#ESP02_Humidity


#Aussen
t_out=$(curl -L  http://openhab:8080/rest/items/hmip_temp_outside/state)
h_out=$(curl -L  http://openhab:8080/rest/items/hmip_humi_outside/state)

#Alarm
al_active=$(curl -L  http://openhab:8080/rest/items/HomematicIP_AlarmStatusExtern/state)
#al_window=$(curl -L  http://openhab:8080/rest/items/hmip_temp_bathroom/state)

echo "<p style="color:#777">"
echo "<strong>HomematicIP</strong>"
echo "</p>"
echo "<p style="color:#888">"
echo "Wohzimmer: $t_wz° $h_wz%"
echo "<br>"
echo "Bad: $t_bad° $h_bad%"
echo "<br>"
echo "Aussen: $t_out° $h_out%"

if [ $al_active == ON ]; then
echo "<p style="color:#FF0000">ALARM scharf</p>"
else
echo "<p style="color:#6EC300">ALARM unscharf</p>"
fi
echo "<br><br>"


