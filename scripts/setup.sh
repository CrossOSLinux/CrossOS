#!/bin/bash
# Cross OS - Post Install Setup
set -e

echo "Setting up Cross OS..."

# --- Pacman network reliability ---
echo "Configuring pacman..."
if ! grep -q "wget" /etc/pacman.conf; then
    sudo sed -i 's/#XferCommand.*/XferCommand = \/usr\/bin\/wget --tries=5 --timeout=30 -O %o %u/' /etc/pacman.conf
    echo "Pacman network retry configured."
else
    echo "Pacman already configured, skipping."
fi

# --- Yay AUR helper ---
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    sudo pacman -S --noconfirm yay
    echo "yay installed."
else
    echo "yay already installed, skipping."
fi

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
# Cross OS - Launch fish for interactive sessions
if [[ $- == *i* ]]; then
    exec fish
fi' >> ~/.bashrc
    echo "Fish activation added to bashrc."
else
    echo "Fish activation already in bashrc, skipping."
fi
echo "Fish setup complete."

echo "================================"
echo "  Setup complete."
echo "  Reboot to finish."
echo "================================"
