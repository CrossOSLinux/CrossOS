#!/bin/bash
# Cross OS - Post Install Setup
set -e

echo "Setting up Cross OS..."


# --- Systemd Services ---
echo "Enabling services..."
sudo systemctl enable greetd
sudo systemctl disable sddm 2>/dev/null || true
sudo systemctl disable lightdm 2>/dev/null || true
echo "Services configured."

# --- Git ---
echo "Configuring git..."
git config --global user.name "crossfire"
git config --global user.email "youremail@gmail.com"
git config --global init.defaultBranch main
echo "Git configured."

# --- Fish ---
echo "Setting up fish..."
if ! grep -q "exec fish" ~/.bashrc; then
    echo '

# Cross OS - Launch fish for interactive sessio
if [[ $- == *i* ]]; then
    exec fish
fi' >> ~/.bashrc
    echo "Fish activation added to bashrc."
else
    echo "Fish activation already in bashrc, skipping."
fi
echo "Fish setup complete."

# Network manager 
sudo systemctl enable NetworkManager
sudo systemctl disable dhcpcd
sudo systemctl stop dhcpcd

echo "--- Setup Complete ---"
echo ""
echo " Have fun <_> "
