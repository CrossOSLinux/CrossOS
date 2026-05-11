#!/bin/bash
# Cross OS - Config Installer
set -e

CROSSOS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIGS="$CROSSOS_DIR/configs"

echo "--- Installing configs ---"

# Hyprland
mkdir -p ~/.config/hypr
cp "$CONFIGS/hyprland/hyprland.conf" ~/.config/hypr/hyprland.conf
echo "Hyprland config installed."

# Waybar
mkdir -p ~/.config/waybar
cp "$CONFIGS/waybar/config.jsonc" ~/.config/waybar/config.jsonc
cp "$CONFIGS/waybar/style.css" ~/.config/waybar/style.css
echo "Waybar config installed."



# # Foot
# mkdir -p ~/.config/foot
# cp "$CONFIGS/foot/foot.ini" ~/.config/foot/foot.ini
# echo "Foot config installed."

# # Fuzzel
# mkdir -p ~/.config/fuzzel
# cp "$CONFIGS/fuzzel/fuzzel.ini" ~/.config/fuzzel/fuzzel.ini
# echo "Fuzzel config installed."
#

# Greetd
sudo cp "$CONFIGS/greetd/config.toml" /etc/greetd/config.toml
echo "Greetd configured"

echo "All configs installed."
