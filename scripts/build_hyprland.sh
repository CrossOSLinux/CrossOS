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


# Add this at the top of build_hyprland.sh after the yay install check
echo "--- Removing all existing hypr packages ---"
sudo pacman -Rdd --noconfirm hyprland hyprlang hyprutils hyprgraphics hyprwayland-scanner xdg-desktop-portal-hyprland hyprland-qt-support hyprland-qtutils hyprcursor 2>/dev/null || true
echo "All hypr packages removed."

# Function that removes stable version then builds git version
replace_with_git() {
    local pkg=$1
    echo "--- Replacing $pkg with git version ---"
    
    # Remove stable version if installed, ignore dependency errors
    if pacman -Q "$pkg" &>/dev/null; then
        echo "Removing $pkg..."
        sudo pacman -Rdd --noconfirm "$pkg" 2>/dev/null || true
    fi
    
    # Remove git version if already installed to avoid conflicts
    if pacman -Q "${pkg}-git" &>/dev/null; then
        echo "${pkg}-git already installed, skipping..."
        return
    fi
    
    echo "Building ${pkg}-git..."
    yay -S --noconfirm "${pkg}-git"
    echo "${pkg}-git installed."
}

# Build in dependency order
replace_with_git "hyprwayland-scanner"
replace_with_git "hyprlang"
replace_with_git "hyprutils"
replace_with_git "hyprgraphics"
replace_with_git "hyprcursor"
replace_with_git "xdg-desktop-portal-hyprland"
replace_with_git "hyprland-qt-support"
replace_with_git "hyprland-qtutils"

# Hyprland itself
echo "--- Building Hyprland ---"
if pacman -Q "hyprland" &>/dev/null; then
    sudo pacman -Rdd --noconfirm hyprland 2>/dev/null || true
fi
yay -S --noconfirm hyprland-git

echo ""
echo "================================"
echo "  Build complete."
echo "  Run: hyprland --version"
echo "================================"
