#!/bin/bash
# Cross OS - Package Installer 
set -e

REPO_DIR=~/CrossOS

# Add Hyprland 
sudo cp /usr/share/xbps.d/00-repository-main.conf /etc/xbps.d/
sudo sed -i "1i repository=https://mirror.black-hole.dev/$(xbps-uhelper arch)" /etc/xbps.d/00-repository-main.conf

# Add Noctalia Shell 
# echo "repository=https://repo.voiders.dev" | sudo tee /etc/xbps.d/10-voiders-community.conf

sudo xbps-install -S # sync packges with repos.

install_packages() {
    local file=$1
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        [[ -z "$pkg" || "$pkg" == \#* ]] && continue
        if xbps-query -S "$pkg" &>/dev/null; then
            echo "$pkg already installed, skipping..."
        else
            install_with_retry "$pkg"
        fi
    done < "$file"
}

install_with_retry() {
    local pkg=$1
    local attempts=0
    until sudo xbps-install -Sy "$pkg"; do
        attempts=$((attempts + 1))
        if [ $attempts -eq 5 ]; then
            echo "Failed to install $pkg after 5 attempts, skipping..."
            return
        fi
        echo "Network error, retry $attempts of 5 for $pkg..."
        sleep 3
    done
}

gum style \
    --border normal \
    --align center \
    --bold \
    --foreground "#b5ebff" \
    --width 50 \
    "Updating the system"


sudo xbps-install -Syu

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
