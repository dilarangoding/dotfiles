#!/bin/bash

BATTERY_NAME="BAT0"
BAT_PATH="/sys/class/power_supply/$BATTERY_NAME"
notif_20_sent=0
notif_10_sent=0

while true; do

    status=$(cat "$BAT_PATH/status")
    capacity=$(cat "$BAT_PATH/capacity")

    if [ "$status" = "Discharging" ]; then

        if [ "$capacity" -le 10 ] && [ "$notif_10_sent" -eq 0 ]; then
            notify-send -u critical "BATERAI KRITIS (10%)" "HARUS CHARGE SEKARANG BRO!"
            notif_10_sent=1
            notif_20_sent=1 

        elif [ "$capacity" -le 20 ] && [ "$notif_20_sent" -eq 0 ]; then
            notify-send -u normal "Baterai Lemah (20%)" "Mesti di-charge."
            notif_20_sent=1
        fi

    else
        notif_20_sent=0
        notif_10_sent=0
    fi
    sleep 60

done
