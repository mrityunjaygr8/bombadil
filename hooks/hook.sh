MY_USER=mrityunjaygr8
OUT_FILE="/home/$MY_USER/bombadil/hooks/packages.out"
/usr/bin/pacman -Qqen > "$OUT_FILE" 
chown "$MY_USER":"$MY_USER" "$OUT_FILE"
echo "packages written to $OUT_FILE"

