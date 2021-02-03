## install base-devel for installing paru
# sudo pacman -S base-devel
## clone paru-bin
# git clone https://aur.archlinux.org/paru-bin.git
# cd paru-bin && makepkg -si && cd -
## install toml-bombadil
# paru -S bombadil-bin
## clone my bombadil repo
# git clone https://github.com/mrityunjaygr8/bombadil.git
# bombadil install -c bombadil/bombadil.toml
# bombadil link
# mkdir -p .config
## install zplug, zsh
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
## now our pacman hook has been created, the hook's post run script has been generated
## further, the configs have been placed where they need to be
## now we can just install the packages
# sudo pacman -S --needed - < bombadil/hooks/pacman_pkglist.out
# paru -S --needed - < bombadil/hooks/aur_pkglist.out
## change shell to zsh
# chsh -s $(which zsh)

## reboot
# sudo reboot now
