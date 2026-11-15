#!/bin/bash
set -e

bash <(curl -s https://ii.clsty.link/get)

gitdir=/tmp/dotstmp
mkdir -p $gitdir

pacman -S git --noconfirm --needed

git clone https://github.com/nazwasadfh/dots $gitdir || rm -rf $gitdir && git clone https://github.com/nazwasadfh/dots $gitdir
echo "whats your homedir? (/home/yourname - without the / at the end)"
read homedir
mkdir -p "$homedir/.config/"
cp "$gitdir/starship.toml" $homedir/.config
cp "$gitdir/face.jpg" $homedir/
mkdir -p $homedir/.config/hypr
rm -rf $homedir/.config/hypr
cp "$gitdir/hypr" -r "$homedir/.config/"
cp "$gitdir/fastfetch" -r "$homedir/.config/"
cp "$gitdir/kitty" -r "$homedir/.config/"
cp "$gitdir/.zshrc" "$homedir/"
pacman -S nvim --noconfirm --needed
git clone https://github.com/LazyVim/starter ~/.config/nvim
pacman -S easyeffects --noconfirm --needed
cp "$gitdir/superduper.json" $homedir/.local/share/easyeffects/output/

pacman -S zip unzip --needed --noconfirm
pacman -S ttf-victor-mono-nerd
mkdir -p $homedir/Obrazy/Wallpapers
cp $gitdir/img_0946.jpg $homedir/Obrazy/Wallpapers/img_0946.jpg

cd ~/.config/quickshell/ && git clone https://github.com/pctrade/end4-pC.git
