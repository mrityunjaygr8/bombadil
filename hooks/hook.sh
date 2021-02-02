MY_USER=mrityunjaygr8
PACMAN_PKGLIST="/home/$MY_USER/bombadil/hooks/pacman_pkglist.out"
AUR_PKGLIST="/home/$MY_USER/bombadil/hooks/aur_pkglist.out"
/usr/bin/pacman -Qqen > "$PACMAN_PKGLIST" 
/usr/bin/pacman -Qqem > "$AUR_PKGLIST"
chown "$MY_USER":"$MY_USER" "$PACMAN_PKGLIST"
chown "$MY_USER":"$MY_USER" "$AUR_PKGLIST"
echo "packages written to $PACMAN_PKGLIST and $AUR_PKGLIST"

