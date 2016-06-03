#!/bin/bash

# Exit script if return code != 0
set -e

# Configure pacman with snapshot repository
source /root/pacman-init.sh

source /root/functions.sh

# Cleanup
pacman_cleanup
