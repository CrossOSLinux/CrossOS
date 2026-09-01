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


# --- Fish ---
echo "Setting up fish..."
if ! grep -q "exec fish" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc

# Auto-start Fish for interactive sessions
if [[ $- == *i* ]]; then
    exec fish
fi
EOF
    echo "Added exec fish to bashrc"
else
    echo "Fish luanch alreadyh in bashrc, skipping"
fi

echo "-------------------"
echo "Fish setup complete."

# Network manager 
sudo systemctl enable NetworkManager
sudo systemctl disable dhcpcd
sudo systemctl stop dhcpcd

# Wallpaper
sudo mkdir -p /usr/share/backgrounds/crossos
sudo cp assets/wallpapers/* /usr/share/backgrounds/crossos/


echo "--- Setup Complete ---"
echo ""
echo " Have fun <_> "
