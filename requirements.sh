#!/bin/bash

set -e

# Update system
sudo pacman -Syu --noconfirm

# Install yay from AUR
cd /tmp
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si --noconfirm
cd ..
rm -rf yay-git

# Install packages from AUR
yay -S --noconfirm \
  hyprland-git \
  kitty \
  wl-clip-persist \
  sddm-theme-sugar-candy-git \
  megatools \
  xwaylandvideobridge \
  eww \
  wl-gammarelay

# Install packages from official repositories
sudo pacman -S --noconfirm \
  wofi \
  sddm \
  zsh \
  lsd \
  bat \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  hypridle \
  hyprpaper \
  hyprlock \
  waybar \
  polkit \
  polkit-gnome \
  pavucontrol \
  slurp \
  grim \
  swappy \
  fastfetch \
  wget \
  unzip \
  pamixer \
  wl-clipboard

echo "✅ Installation completed successfully."
