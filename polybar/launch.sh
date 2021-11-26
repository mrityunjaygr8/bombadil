#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
for monitor in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo "Starting top bar on monitor '$monitor'"
    MONITOR="$monitor" polybar example &
done
echo "Polybar launched..."
