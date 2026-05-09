#!/bin/bash
# Cross OS - Hyprland Builder
# Builds Hyprland and all hypr dependencies from AUR
# Run time: 1-2 hours on Pi 5
set -e

echo "================================"
echo "  Cross OS - Building Hyprland"
echo "================================"

# Install yay if not present
if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  sudo pacman -S --noconfirm base-devel git
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ~
fi

echo "--- Removing outdated hypr packages ---"
sudo pacman -R --noconfirm \
  hyprland \
  hyprlang \
  hyprutils \
  hyprgraphics \
  hyprwayland-scanner \
  xdg-desktop-portal-hyprland \
  hyprland-qt-support \
  hyprland-qtutils \
  hyprcursor 2>/dev/null || true

echo "--- Building hypr dependencies in order ---"

echo "Building hyprwayland-scanner..."
yay -S --noconfirm hyprwayland-scanner-git

echo "Building hyprlang..."
yay -S --noconfirm hyprlang-git

echo "Building hyprutils..."
yay -S --noconfirm hyprutils-git

echo "Building hyprgraphics..."
yay -S --noconfirm hyprgraphics-git

echo "Building hyprcursor..."
yay -S --noconfirm hyprcursor-git

echo "Building xdg-desktop-portal-hyprland..."
yay -S --noconfirm xdg-desktop-portal-hyprland-git

echo "Building hyprland-qt-support..."
yay -S --noconfirm hyprland-qt-support-git

echo "Building hyprland-qtutils..."
yay -S --noconfirm hyprland-qtutils-git

echo "--- Building Hyprland ---"
yay -S --noconfirm hyprland-git

echo ""
echo "================================"
echo "  Build complete."
echo "  Run: hyprland --version"
echo "================================"
