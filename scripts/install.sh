#!/bin/bash

# CrossOS install script runs to make the distro .
# VERSION = 0.0.1
# Date = 7/5/26

set -e # Exit if command fails in the script

# Update Arch system
echo "Updating Arch wait for it . "
sudo pacman -Syu --nonconfirm

# Install enough packages to use the system

REPO_DIR=~/crossos

install_packages() {
  local file=$1
  echo "Installing packages from $file..."
  while IFS= read -r pkg || [[ -n "$pkg" ]]; do
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue
    echo "Installing $pkg..."
    sudo pacman -S --noconfirm "$pkg"
  done <"$file"
}
install_packages "$REPO_DIR/packages/base.txt"

echo "fish" >>~/.bashrc
