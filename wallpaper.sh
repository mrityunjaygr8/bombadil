wal -i $HOME/Pictures/slide
feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
# gsettings set org.gnome.desktop.background picture-uri file:///"$(< "${HOME}/.cache/wal/wal")"
# $HOME/commands/Pywalfox/daemon/pywalfox.py update
