#!/bin/bash

# CrossOS install script runs to make the distro .
# VERSION = 0.0.2
# Date = 8/5/26

set -e # Exit if command fails in the script


# Install enough packages to use the system

SCRIPTS_DIR=~/CrossOS/scripts

echo "Running complete installer..."

bash "$SCRIPTS_DIR/packages.sh"
bash "$SCRIPTS_DIR/configs.sh"
bash "$SCRIPTS_DIR/setup.sh"

echo "Install Completed"
