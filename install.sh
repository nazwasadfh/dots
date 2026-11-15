set -e
gitdir=/tmp/dotstmp
mkdir -p $gitdir

pacman -S git --needed

git clone https://github.com/nazwasadfh/dots $gitdir
