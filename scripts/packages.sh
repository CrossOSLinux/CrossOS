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
            install_with_retry "$pkg"
        fi
    done < "$file"
}

install_with_retry() {
    local pkg=$1
    local attempts=0
    until sudo xbps-install -S --noconfirm "$pkg"; do
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

sudo pacman -Syu --noconfirm

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
