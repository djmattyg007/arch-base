#!/bin/bash

# Exit script if return code != 0
set -e

# Configure pacman with snapshot repository
echo "Upgrade system, install additional core packages"
source /root/pacman-init.sh

source /root/functions.sh

# Cleanup
pacman_cleanup
