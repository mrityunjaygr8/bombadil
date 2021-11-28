local apps = require('configuration.apps')
local filesystem = require('gears.filesystem')

-- List of apps to start once on start-up
return {
  run_on_start_up = {

    'picom --config ~/.config/picom/picom.conf',
    'nm-applet --indicator', -- wifi
    'mate-power-manager', -- Power manager
    'pasystray', -- PulseAudio Systray Application
    'numlockx on', -- enable numlock
    'redshift -l  18.55432:73.94159', -- redshift with kharadi co-ordinates
    'xfce4-clipman', -- clipboard manager
    -- '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager (alternate directory if the first one is incorrect)
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'blueman-applet', -- bluetooth tray
    'uget-gtk', -- uget download manager

    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/autostartonce.sh' -- Spawn "dirty" apps that can linger between sessions

  }
}
