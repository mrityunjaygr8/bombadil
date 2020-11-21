local apps = require('configuration.apps')
local filesystem = require('gears.filesystem')

-- List of apps to start once on start-up
return {
  run_on_start_up = {

    'picom --config ' .. filesystem.get_configuration_dir() .. 'configuration/picom.conf',
    'nm-applet --indicator', -- wifi
    'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    'pasystray', -- PulseAudio Systray Application
    'numlockx on', -- enable numlock
    -- '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager (alternate directory if the first one is incorrect)
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'blueman-tray', -- bluetooth tray
    'uget-ght', -- uget download manager
    -- 'dunst', -- notifiaction daemon

    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/autostartonce.sh' -- Spawn "dirty" apps that can linger between sessions

  }
}
