set -e # Exit if command fails in the script

# Update Arch system
echo "Updating Arch wait for it . "
sudo pacman -Syu --noconfirm

# Install enough packages to use the system

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
  done <"$file"
}

echo "Installing amazing pakages"

install_packages "$REPO_DIR/packages/base.txt"
