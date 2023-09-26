#!/bin/bash

# Exit on error
set -e

# Update and Upgrade
echo "Updating and Upgrading..."
sudo apt update && sudo apt upgrade -y

# Install vim and curl
sudo apt install vim -y
sudo apt install curl -y
sudo apt install git -y

# Install Chrome
echo "Installing Google Chrome..."
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install -y

echo "Installing Telegram..."
sudo -Sk apt install -y telegram-desktop

# Install Tmux
echo "Installing Tmux..."
sudo apt-get install tmux -y

# Install ZSH and Oh My Zsh
echo "Installing ZSH..."
sudo apt install zsh -y
chsh -s $(which zsh)

echo "Installing Oh My Zsh..."
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# Install EXA and alias ls to exa
echo "Installing EXA..."
sudo apt install exa -y
echo "alias ls='exa'" >> ~/.zshrc

# Put plugins to Oh My Zsh
echo "Setting up Oh My Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git z brew jsontools zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Install powerlevel10k theme
echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/' ~/.zshrc

# Install latest Python
echo "Installing latest Python..."
sudo apt install python3 python3-pip -y

# Install Golang
echo "Installing Golang..."
sudo apt install golang -y

# Install Node.js
echo "Installing Node.js..."
sudo apt install nodejs -y

# Install GCC
echo "Installing GCC..."
sudo apt install gcc gcc-c++ -y

# Install Visual Studio Code (VSCode)
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code -y

echo "All Done! Please restart your terminal or source your .zshrc file."