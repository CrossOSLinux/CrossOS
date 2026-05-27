#!/bin/bash

# CrossOS install script runs to make the distro .
# VERSION = 0.0.5
# Date = 18/5/26

set -e # Exit if command fails in the script
sudo -v # ask for sudo 

while true; do
    sudo -n true
    sleep 60
    # Kill this loop automatically if the main script exits
    kill -0 "$$" || exit
done 2>/dev/null &

# silent install of gum
sudo pacman -Sy --noconfirm gum > /dev/null 2>&1


# Install enough packages to use the system

SCRIPTS_DIR=~/CrossOS/scripts

gum style \
        --border double \
        --border-background "#181f21" \
        --border-foreground "#b8d7e3" \
        --background "#181f21" \
        --foreground "#b5ebff" \
        --bold \
        --width 75  \
        --padding "1 1" \
        --margin "2 2" \
        --align center \
        "Installing CrossOS! "


bash "$SCRIPTS_DIR/packages.sh"
bash "$SCRIPTS_DIR/configs.sh"
bash "$SCRIPTS_DIR/setup.sh"

echo "Install Completed"

