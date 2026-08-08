#!/bin/bash
# Cross OS - Post Install Setup (Runit)
set -e

echo "Setting up Cross OS..."

# --- Runit Services ---
echo "Enabling services..."

# Enable greetd
if [ -d /etc/sv/greetd ]; then
    sudo ln -sf /etc/sv/greetd /var/service/
fi

# Disable display managers 
sudo rm -f /var/service/sddm
sudo rm -f /var/service/lightdm

# Network Manager configuration
# sudo ln -sf /etc/sv/NetworkManager /var/service/
# sudo rm -f /var/service/dhcpcd 2>/dev/null || true

# Stop dhcpcd immediately if running
# sudo sv down dhcpcd 2>/dev/null || true

echo "Services configured."

# --- Git ---
echo "Configuring git..."
git config --global user.name "crossfire"
git config --global user.email "vaibhavk2032@gmail.com"
git config --global init.defaultBranch main
echo "Git configured."

# --- Fish ---
echo "Setting up fish..."
if ! grep -q "exec fish" ~/.bashrc; then
    echo '

if [[ $- == *i* ]]; then
    exec fish
fi' >> ~/.bashrc
    echo "Fish activation added to bashrc."
else
    echo "Fish activation already in bashrc, skipping."
fi
echo "Fish setup complete."

echo "--- Setup Complete ---"
echo ""
echo " Have fun <_> "
