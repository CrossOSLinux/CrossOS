#!/bin/bash
# Cross OS - Post Install Setup
# Handles systemd services, system level config, and anything
# that needs to run after packages and configs are installed
set -e

echo "Setting up the OS"

# --- Systemd Services ---
echo "Enabling services..."

# Greetd - display manager
sudo systemctl enable greetd

echo "Services configured."
echo "Setup complete "
