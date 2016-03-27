#!/bin/bash

# Exit script if return code != 0
set -e

# Configure pacman with snapshot repository
source /root/pacman-init.sh

# Create nobody user
source /root/user-init.sh

# Install any packages
source /root/aur.sh
aur_start
aur_build runit
aur_finish

mkdir -p /etc/service

# Cleanup
source /root/pacman-cleanup.sh
