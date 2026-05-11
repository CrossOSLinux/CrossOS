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

# --- Neovim ---
if pacman -Q neovim &>/dev/null; then
    echo "Setting up neovim..."
    # Install lazy.nvim plugin manager
    git clone --filter=blob:none \
        https://github.com/folke/lazy.nvim.git \
        --branch=stable \
        ~/.local/share/nvim/lazy/lazy.nvim
fi

echo "Setup complete "
