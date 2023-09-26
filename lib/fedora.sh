#!/bin/bash

# Exit on error
set -e

# Update and Upgrade
echo "Updating and Upgrading..."
sudo dnf update -y

# Install vim, curl, and git
echo "Installing vim, curl, git..."
sudo dnf install vim curl git -y

# Install Google Chrome
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo rpm -i google-chrome-stable_current_x86_64.rpm

# Install Telegram
echo "Installing Telegram..."
sudo dnf install telegram-desktop -y

# Install Tmux
echo "Installing Tmux..."
sudo dnf install tmux -y

# Install ZSH and Oh My Zsh
echo "Installing ZSH..."
sudo dnf install zsh -y
chsh -s $(which zsh)

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install EXA and alias ls to exa
echo "Installing EXA..."
sudo dnf install exa -y
echo "alias ls='exa'" >> ~/.zshrc

# Set up Oh My Zsh plugins
echo "Setting up Oh My Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git z brew jsontools zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Install powerlevel10k theme
echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install latest Python
echo "Installing latest Python..."
sudo dnf install python3 python3-pip -y

# Install Golang
echo "Installing Golang..."
sudo dnf install golang -y

# Install Node.js
echo "Installing Node.js..."
sudo dnf install nodejs -y

# Install GCC
echo "Installing GCC..."
sudo dnf install gcc gcc-c++ -y

# Install Visual Studio Code (VSCode)
echo "Installing Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code -y

echo "All Done! Please restart your terminal or source your .zshrc file."
