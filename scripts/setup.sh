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

# Fish setup
echo "loading Fish service "

# Launch fish from bashrc
if ! grep -q "exec fish" ~/.bashrc; then
    echo '
# Cross OS - Launch fish for interactive sessions
if [[ $- == *i* ]]; then
    exec fish
fi' >> ~/.bashrc
    echo "Fish activation added to bashrc."
else
    echo "Fish activation already in bashrc, skipping."
fi

# Fish theme
fish -c "fish_config theme choose 'ayu Dark'"

echo "Fish setup complete"

echo "Setup complete "
