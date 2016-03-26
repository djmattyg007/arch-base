#!/bin/bash

# Exit script if return code != 0
set -e

aur_start() {
    # Install packages that all PKGBUILDs automatically assume are installed
    pacman -S --needed --noconfirm base-devel
    # Create "makepkg-user" user for building packages, as we can't and shouldn't
    # build packages as root (although we're effectively root all the time when
    # interacting with docker, so it's a bit of a moot point...)
    useradd -m -s /bin/bash makepkg-user
    echo -e "makepkg-password\nmakepkg-password" | passwd makepkg-user
    #echo "makepkg-user ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
}

aur_finish() {
    # Remove "makepkg-user" - we don't want unnecessary users lying around in the image
    userdel -r makepkg-user
    # Remove base-devel packages, except a few useful core packages
    pacman -Ru --noconfirm $(pacman -Qgq base-devel | grep -v pacman | grep -v sed | grep -v grep | grep -v gzip)
}
