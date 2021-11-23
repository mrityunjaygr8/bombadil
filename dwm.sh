#! /bin/bash
feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
picom --config "$HOME/.config/picom/picom.conf" &
# # Network Manager
nm-applet --indicator &
# # Power manager
# mate-power-manager
# # Pulse Audio Systray
pasystray &

# BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
# STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
# DATE=$(date + "%R")
# while true; do
#   xsetroot -name "` date +"%R"`"
#   # xsetroot -name "`$BATT $STATUS $DATE`"
# done &

while true; do
  dwm > /dev/null 2>&1
done

exec dwm
