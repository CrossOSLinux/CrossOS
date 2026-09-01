#!/bin/bash
# Cross OS - Config Installer
set -e

CROSSOS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIGS="$CROSSOS_DIR/configs"

echo "--- Installing configs ---"

# Hyprland
mkdir -p ~/.config/hypr/
cp -r "$CONFIGS/hyprland/." ~/.config/hypr/

echo "Hyprland config installed."

# Waybar
#mkdir -p ~/.config/waybar
#cp "$CONFIGS/waybar/config.jsonc" ~/.config/waybar/config.jsonc
#cp "$CONFIGS/waybar/style.css" ~/.config/waybar/style.css
#echo "Waybar config installed."

# # Foot
cp -r "$CONFIGS/foot/" ~/.config/
echo "Foot config installed."

# # Fuzzel
cp -r "$CONFIGS/fuzzel/" ~/.config/
echo "Fuzzel config installed."
#

# Greetd
sudo cp "$CONFIGS/greetd/config.toml" /etc/greetd/config.toml
echo "Greetd configured"

# Fish
cp -r "$CONFIGS/fish/" ~/.config/

echo "All configs installed."
