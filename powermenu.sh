#! /bin/bash

function powermenu {
  options="Cancel\nShutdown\nRestart\nLogout\nSleep" #\nLock"
  selected=$(echo -e $options | dmenu)
  if [[ $selected = "Shutdown" ]]; then
    poweroff
  elif [[ $selected = "Restart" ]]; then 
    reboot
  elif [[ $selected = "Sleep" ]]; then 
    systemctl suspend
  elif [[ $selected = "Logout" ]]; then 
    loginctl terminate-user "$USER"
  # elif [[ $selected = "Lock" ]]; then 
  #   reboot
  elif [[ $selected = "Cancel" ]]; then 
    return
  fi
}

powermenu
