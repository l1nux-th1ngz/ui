#!/bin/sh
# Simple script to show the cpu temp formatted to be shown in waybar

temp=$(sensors | grep "Tctl" | sed "s/Tctl: *+//;s/°C  *//" )
tempF=$(echo "scale=2;((9/5) * $temp) + 32" | bc)
if [ 1 -eq "$(echo "$temp > 70 " | bc)" ]; then
    printf "<span color='#FD807E'>🔥 $tempF°F </span>";  
elif [ 1 -eq "$(echo "$temp > 50 " | bc)" ]; then
    printf "<span color='#f5a97f'>🔥 $tempF°F </span>";
elif [ 1 -eq "$(echo "$temp > 15 " | bc)" ]; then
    printf "<span color='#F3A3BC'>🔥 $tempF°F </span>"; 
fi
