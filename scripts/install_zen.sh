#!/bin/bash
# Cross OS - Zen Browser Installer
# Uses official ARM64 builds from GitHub releases
set -e

echo "Installing Zen Browser..."

# Fetch latest version automatically from GitHub API
VERSION=$(curl -s https://api.github.com/repos/zen-browser/desktop/releases/latest |
  grep '"tag_name"' |
  cut -d'"' -f4)

echo "Latest version: $VERSION"

# Download
cd /tmp
wget "https://github.com/zen-browser/desktop/releases/download/${VERSION}/zen.linux-aarch64.tar.xz"

# Install
sudo rm -rf /opt/zen-browser
sudo tar xf zen.linux-aarch64.tar.xz -C /opt
sudo mv /opt/zen /opt/zen-browser
rm -f zen.linux-aarch64.tar.xz

# Wayland launcher fix
git clone --depth 1 https://github.com/ArchitektApx/zen-browser-arm64-copr
sed -i 's+exec /opt/zen-browser/zen-bin+exec /opt/zen-browser/zen-bin --class zen-browser --name zen-browser+g' \
  zen-browser-arm64-copr/zen-browser
sudo mv -f zen-browser-arm64-copr/zen-browser /usr/bin/zen-browser
sudo chmod +x /usr/bin/zen-browser

# Desktop entry
sudo mv -f zen-browser-arm64-copr/zen-browser.desktop /usr/share/applications

# Disable update notifications
sudo mkdir -p /opt/zen-browser/distribution
sudo mv -f zen-browser-arm64-copr/policies.json /opt/zen-browser/distribution

# Icons
for i in 16x16 32x32 48x48 64x64 128x128; do
  sudo mkdir -p /usr/share/icons/hicolor/$i/apps/
  sudo cp /opt/zen-browser/browser/chrome/icons/default/default${i/x*/}.png \
    /usr/share/icons/hicolor/$i/apps/zen-browser.png
done

sudo update-icon-caches /usr/share/icons/*
rm -rf zen-browser-arm64-copr

echo "Zen Browser $VERSION installed."
echo "Run with: zen-browser"
