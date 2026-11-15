#!/bin/bash
set -e
gitdir=/tmp/dotstmp
mkdir -p $gitdir

pacman -S git --needed

git clone https://github.com/nazwasadfh/dots $gitdir || rm -rf $gitdir && git clone https://github.com/nazwasadfh/dots $gitdir
echo "whats your homedir? (/home/yourname - without the / at the end)"
read homedir
mkdir -p "$homedir/.config/"
cp "$gitdir/starship.toml" $homedir/.config
