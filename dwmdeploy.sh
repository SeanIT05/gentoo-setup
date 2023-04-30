#!usr/bin/env bash

# Prerequisites
echo -e "\e[0;31mSet up sudo and a user, else this script wont work \e[0m\n"

# Creating user
sleep 0.5

# Welcoming user
echo -e "\e[0;35mDWM Deployment script by SeanIT05 \e[0m"
sleep 3

# Shameless plug
echo -e "Have a look at \e[0;35mhttps://github.com/SeanIT05/ \e[0m\n"

echo -e "\e[0;36mInstalling required packages! \e[0m"

echo "Installing xorg, git, libXft, libXinerama"
sleep 0.5

# Requires packages
sudo emerge dev-vcs/git libXft libXinerama xorg-server 

# Copying files and config
echo -e "\e[0;36mCopying necessary files and config \e[0m"

# DWM Building
# Copying to /home/$USER
sudo mkdir .config
sudo cp -a config .config
cd .config/dwm && sudo make clean install
cd .config/slstatus && sudo make clean install
cd .config/dmenu && sudo make clean install

echo -e "Have a look at \e[0;36mBuilt DWM and configuration copied! \e[0m"
echo -e "Have a look at \e[0;36mEmerging alacritty \e[0m"
sleep 0.3
sudo emerge -av alacritty
