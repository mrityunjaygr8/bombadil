#!/usr/bin/env bash

pictures_dir="$(xdg-user-dir PICTURES 2> /dev/null)"
slice="${pictures_dir:-$HOME/Pictures}slice.png"
# lock="${pictures_dir:-$HOME/Pictures}/lock.png"
image=$(< $HOME/.cache/wal/wal)
echo "$image"
#trap 'rm -f "$image"' SIGINT SIGTERM EXIT

#screens=$(xrandr | grep -Eo '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')
#declare -a lines
#
#for screen in $screens; do
#    read -r W H X Y < <(sed 's/[^0-9]/ /g' <<< "$screen")
#    lines+=(\( "$slice" -resize "${W}x1080!" -geometry "+${X}+${Y}" \) -composite -matte)
#done
#echo "$lines"
#
#
#maim -u -m 1 \
#    | convert png:- -scale 10% -scale 1000% \
#    -fill "#282828" -colorize 10% \
#    ${lines[*]} "$image"

# maim -u \
#     | convert png:- -scale 10% -scale 1000% \
#     "$lock" -gravity NorthWest -composite -matte "$image"

# for screen in $screens; do
#     mapfile -t coords < <(grep -Eo '[0-9]+' <<< "$screen")
#     coords[0]=$(( ${coords[0]} + ${coords[2]} ))
#     coords[1]=$(( ${coords[1]} + ${coords[3]} ))
#
#     outer=($(( ${coords[3]} + 669 )) $(( ${coords[3]} + 771 )))
#     inner=($(( ${coords[3]} + 677 )) $(( ${coords[3]} + 763 )))
#
#     convert "$image" -fill '#504945' -draw "rectangle ${coords[2]},${outer[0]} ${coords[0]},${outer[1]}" \
#         -fill '#282828' -draw "rectangle ${coords[2]},${inner[0]} ${coords[0]},${inner[1]}" "$image"
# done

i3lock \
    --color=282828 \
    --image="$image" \
    --inside-color=282828FF \
    --insidever-color=FABD2FFF \
    --insidewrong-color=FB4934FF \
    --ring-color=282828FF \
    --ringver-color=282828FF \
    --ringwrong-color=282828FF \
    --line-color=EBDBB2FF \
    --keyhl-color=EBDBB2FF \
    --bshl-color=FB4935FF \
    --separator-color=282828FF \
    --verif-color=00000000 \
    --wrong-color=00000000 \
    --layout-color=00000000 \
    --time-color=EBDBB2FF \
    --date-color=00000000 \
    --ind-pos='x+100:y+720' \
    --time-pos='x+280:y+732' \
    --time-str='%H:%M:%S' \
    --time-font='monospace' \
    --tiling \
    --time-size=32 \
    --radius=32 \
    --ring-width=4 \
    --greeter-text='' \
    --verif-text='' \
    --wrong-text='' \
    --noinput-text='' \
    --lock-text='' \
    --lockfailed-text='' \
    --indicator \
    --ignore-empty-password \
    --pass-media-keys \
    --force-clock
