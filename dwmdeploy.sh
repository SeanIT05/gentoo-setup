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
sleep 2

echo -e "\e[0;36mCopying /etc/portage/make.conf! \e[0m"
sleep 1
sudo cp gentoo/portage/make.conf /etc/portage/make.conf

echo -e "\e[0;36mPreparing your system! \e[0m"

# Requires packages
sudo emerge dev-vcs/git libXft libXinerama xorg-server && sudo mkdir /home/$USER && sudo cp -a config /home/$USER

# Compiling DWM
cd .config/dwm && sudo make clean install
cd .config/slstatus && sudo make clean install
cd .config/dmenu && sudo make clean install

echo -e "Have a look at \e[0;36mBuilt DWM and configuration copied! \e[0m"
echo -e "Have a look at \e[0;36mEmerging alacritty \e[0m"
sleep 0.3
sudo emerge alacritty
