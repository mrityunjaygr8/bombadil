wal -i $HOME/Pictures/slide
feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"
$HOME/commands/Pywalfox/daemon/pywalfox.py update
