#!/bin/bash

# Exit on error
set -e

# https://www.youtube.com/watch?v=lXIb-1_H-mA

sudo apt update
sudo apt dist-upgrade -y
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-manager -y

# Download and install GTK Themes
# https://github.com/vinceliuice/WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
./WhiteSur-gtk-theme/install.sh -t red

# Download and install icon theme
# https://github.com/yeyushengfan258/Reversal-icon-theme
git clone https://github.com/yeyushengfan258/Reversal-icon-theme
./Reversal-icon-theme/install.sh -red


mv extensions/ ~/.local/share/gnome-shell/extensions
mv fonts/ ~/.local/share/fonts/
dconf load /org/gnome/shell/extensions/< all_extension_settings.conf

# Conky (Theme at Desktop)
sudo apt install conky-all curl jq moc -y
mkdir ~/.config/conky
cp -r ./conky_config/Graffias/ ~/.config/conky/
chmod +x conky_config/start_conky.desktop
cp conky_config/start_conky.desktop ~/.config/autostart
