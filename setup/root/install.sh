#!/bin/bash

# Exit script if return code != 0
set -e

# Configure pacman with snapshot repository
source /root/pacman-init.sh

# Create nobody user
source /root/user-init.sh

source /root/aur.sh
aur_start
source /root/aur_runit.sh
aur_finish

# Cleanup
source /root/pacman-cleanup.sh
