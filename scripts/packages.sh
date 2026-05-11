#!/bin/bash
# Cross OS - Package Installer
set -e

REPO_DIR=~/CrossOS

install_packages() {
    local file=$1
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        [[ -z "$pkg" || "$pkg" == \#* ]] && continue
        if pacman -Q "$pkg" &>/dev/null; then
            echo "$pkg already installed, skipping..."
        else
            echo "Installing $pkg..."
            sudo pacman -S --noconfirm "$pkg"
        fi
    done < "$file"
}

echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install yay if not present
if ! command -v yay &>/dev/null; then
    echo "Installing yay..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
    echo "yay installed."
else
    echo "yay already installed, skipping."
fi


case "$1" in
    --dev)
        echo "Installing base packages..."
        install_packages "$REPO_DIR/packages/base.txt"
        echo "Installing dev packages..."
        install_packages "$REPO_DIR/packages/dev.txt"
        ;;
    --complete)
        echo "Installing base packages..."
        install_packages "$REPO_DIR/packages/base.txt"
        echo "Installing dev packages..."
        install_packages "$REPO_DIR/packages/dev.txt"
        echo "Installing complete packages..."
        install_packages "$REPO_DIR/packages/complete.txt"
        ;;
    *)
        echo "Installing base packages..."
        install_packages "$REPO_DIR/packages/base.txt"
        ;;
esac

echo "Packages installed."
