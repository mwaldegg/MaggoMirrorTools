#!/bin/bash
#echo "25.0"
cd ~
~/.local/bin/hmip_cli.py --list-devices > /tmp/hmvalues
~/.local/bin/hmip_cli.py --list-groups > /tmp/hmgroups

#Wohnzimmer
ID="3014F711A0000E9A498BAE8A"
t_wz=$(cat /tmp/hmvalues| grep $ID | sed -s 's/ /\n/g' | grep actualTemperature | cut -d"(" -f2 | sed -s 's/)//g')
h_wz=$(cat /tmp/hmvalues| grep $ID | sed -s 's/ /\n/g' | grep humidity | cut -d"(" -f2 | sed -s 's/)//g')

#Bad
ID="3014F711A0000A9A498D6A7B"
t_bad=$(cat /tmp/hmvalues| grep $ID | sed -s 's/ /\n/g' | grep actualTemperature | cut -d"(" -f2 | sed -s 's/)//g')
h_bad=$(cat /tmp/hmvalues| grep $ID | sed -s 's/ /\n/g' | grep humidity | cut -d"(" -f2 | sed -s 's/)//g')

#Aussen
ID="3014F711A00010D8A990A2FF"
t_out=$(cat /tmp/hmvalues| grep $ID | sed -s 's/ /\n/g' | grep actualTemperature | cut -d"(" -f2 | sed -s 's/)//g')
h_out=$(cat /tmp/hmvalues| grep $ID | sed -s 's/ /\n/g' | grep humidity | cut -d"(" -f2 | sed -s 's/)//g')

#Alarm
ID="SECURITY_ZONE EXTERNAL"
al_active=$(cat /tmp/hmgroups | grep "$ID" | sed -s 's/ /\n/g' | grep active | cut -d"(" -f2 | sed -s 's/)//g')
al_window=$(cat /tmp/hmgroups | grep "$ID" | sed -s 's/ /\n/g' | grep active | cut -d"(" -f2 | sed -s 's/)//g')

echo "<strong>HomematicIP</strong>"
echo "<br>"
echo "Wohzimmer: $t_wz° $h_wz%"
echo "<br>"
echo "Bad: $t_bad° $h_bad%"
echo "<br>"
echo "Aussen: $t_out° $h_out%"

if [ $al_active == True ]; then
echo "<p style="color:#FF0000">ALARM scharf</p>"
else
echo "<p style="color:#6EC300">ALARM unscharf</p>"
fi
echo "<br><br>"

