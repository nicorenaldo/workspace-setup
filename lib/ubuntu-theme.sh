#!/bin/bash

# Exit on error
set -e

# https://www.youtube.com/watch?v=lXIb-1_H-mA

sudo apt update
sudo apt dist-upgrade -y
sudo apt install gnome-tweaks

# Download and install GTK Themes
# https://github.com/vinceliuice/WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
./WhiteSur-gtk-theme/install.sh -t red

# Download and install icon theme
# https://github.com/yeyushengfan258/Reversal-icon-theme
git clone https://github.com/yeyushengfan258/Reversal-icon-theme
./Reversal-icon-theme/install.sh
