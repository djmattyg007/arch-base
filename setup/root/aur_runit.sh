#!/bin/bash

# Exit script if return code != 0
set -e

build_runit() {
    # Download and extract runit package files from AUR
    local tar_path="/tmp/runit.tar.gz"
    curl -L -o ${tar_path} "https://aur.archlinux.org/cgit/aur.git/snapshot/runit.tar.gz"
    tar xvf ${tar_path} -C /tmp

    # Build and install runit
    su -c 'cd /tmp/runit && makepkg' - makepkg-user
    pacman -U "/tmp/runit-*-x86_64.pkg.tar.xz" --noconfirm
}
