#!/bin/bash
# Cross OS - Hyprland Builder
# Builds latest Hyprland from AUR when repos are outdated
# Run time: 30-60 minutes on Pi 5
set -e

echo "Building the newest and best hyprland"

# Check if yay is installed, install if not
if ! command -v yay &>/dev/null; then
  echo "Installing yay AUR helper..."
  sudo pacman -S --noconfirm base-devel git
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ~
  echo "yay installed."
else
  echo "yay already installed, skipping..."
fi

# Check current Hyprland version if installed
if command -v hyprland &>/dev/null; then
  CURRENT=$(hyprland --version 2>&1 | grep -oP '\d+\.\d+' | head -1)
  echo "Current Hyprland version: $CURRENT"
  echo "Building latest from AUR..."
else
  echo "Hyprland not installed, building from AUR..."
fi

# Build and install
echo "Starting build... "
echo ""

yay -S --noconfirm hyprland-git

sudo pacman -R hyprland

hyprland --version
