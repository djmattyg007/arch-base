#!/bin/bash

# Exit script if return code != 0
set -e

echo "Remove package cleanup hook" # WTF?!?!? Why is this a thing????
rm /usr/share/libalpm/hooks/package-cleanup.hook

echo "Updating currently installed packages"
pacman -Sy --noconfirm --noprogressbar --color=never
pacman -S --noconfirm --noprogressbar --color=never archlinux-keyring
pacman -Su --noconfirm --noprogressbar --color=never

echo "Install additional packages"
pacman -S --noconfirm --noprogressbar --color=never grep openssl-1.0

echo "Set en_AU locale"
echo en_AU.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
echo LANG="en_AU.UTF-8" > /etc/locale.conf
