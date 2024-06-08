#!/bin/bash


echo "----------------WELCOME TO VANTESH WIN_WSL CONFIG----------------"

echo "----------------Enter Unix Username----------------"
read user
sudo chown -R $user /home/$user


echo "----------------Enable hushlogin----------------"
touch /home/$user/.hushlogin

echo "----------------Setup Common Software----------------"
sudo apt update && sudo apt upgrade -y
sudo apt install fish  software-properties-common neovim neofetch git curl wget unzip bat -y

echo "----------------Setup Nitch----------------"
wget https://raw.githubusercontent.com/unxsh/nitch/main/setup.sh && sh setup.sh

echo "----------------Setup Bashrc----------------"
sudo cat bashrc > /home/$user/.bashrc
sudo dos2unix /home/$user/.bashrc



echo "----------------Setup Starship For Bash----------------"
curl -sS https://starship.rs/install.sh | sh
if [ -d "/home/$user/.config/" ] 
then
    sudo cat linux_starship.toml > /home/$user/.config/starship.toml 
else
    sudo mkdir /home/$user/.config/ && sudo chown -R $user /home/$user/.config/ &&  sudo cat linux_starship.toml > /home/$user/.config/starship.toml
fi

echo "----------------Setup PowerShell Profile----------------"

echo "----------------Enter Windows Username----------------"
read username
if [ -d "/mnt/c/Users/$username/Documents/WindowsPowerShell/" ] 
then
    sudo cat ps_profile.ps1 > /mnt/c/Users/$username/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
else
    sudo mkdir /mnt/c/Users/$username/Documents/WindowsPowerShell/ && sudo cat ps_profile.ps1 > /mnt/c/Users/$username/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
fi

if [ -d "/mnt/c/Users/$username/.starship/" ]
then
    sudo cat win_starship.toml > /mnt/c/Users/$username/.starship/starship.toml
else
    sudo mkdir /mnt/c/Users/$username/.starship/ && sudo cat win_starship.toml > /mnt/c/Users/$username/.starship/starship.toml
fi

if [ -d "/mnt/c/Users/$username/.config/winfetch/" ]
then
    sudo cat winfetch.ps1 > /mnt/c/Users/$username/.config/winfetch/config.ps1
else
    sudo mkdir /mnt/c/Users/$username/.config/winfetch/ && sudo cat winfetch.ps1 > /mnt/c/Users/$username/.config/winfetch/config.ps1
fi

echo "----------------Setup Command Prompt----------------"
sudo cat starship.lua > /mnt/c/Users/$username/AppData/Local/clink/starship.lua

echo "----------------Setup Windows Terminal----------------"
sudo cat settings.json > /mnt/c/Users/$username/AppData/Local/Packages/Microsoft.WindowsTerminal*/LocalState/settings.json



echo "----------------Setup FiraCode----------------"

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip

echo "----------------Setup EZA  For KALI----------------"
cd /home/$user/
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza



echo "----------------Enable hushlogin----------------"
touch /home/$user/.hushlogin


echo "----------------Download Titlebar Icons For Windows Terminal----------------"
cd /mnt/c/Users/$username/Pictures/ && mkdir icons && cd icons
wget -O ubuntu.png https://img.icons8.com/color/48/000000/ubuntu--v1.png
wget -O fedora.png https://img.icons8.com/fluency/48/000000/fedora.png
wget -O powershell.png https://img.icons8.com/color/48/000000/powershell.png
wget -O cmd.png https://img.icons8.com/color/48/000000/command-line.png

echo "----------------Setup Git----------------"
echo "----------------Enter First Name----------------"
read first
echo "----------------Enter Last Name----------------"
read last
echo "----------------Enter GitHub Email----------------"
read gitemail
git config --global user.name "$first $last"
git config --global user.email "$gitemail"
git config --global credential.helper store

echo "----------------Setup Zshrc----------------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
if [ -d "/home/$user/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
then
    echo "zsh-autosuggestions Already Installed"
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if [ -d "/home/$user/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]
then
    echo "zsh-syntax-highlighting Already Installed"
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
sudo cat zshrc > /home/$user/.zshrc
sudo dos2unix /home/$user/.zshrc

echo "----------------Change Default Shell To Zsh----------------"
chsh -s /usr/bin/zsh
