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

# Mirrorselect
echo "Installing necessary dependencies"
sudo emerge mirrorselect gentoolkit
echo -e "\e[0;36mSelect your mirrors \e[0m"
mirrorselect -i -o >> gentoo-setup/gentoo/portage/make.conf

echo -e "\e[0;35mUsing default make.conf \e[0m"
echo -e "\e[0;31mPlease adjust gentoo/portage/make.conf to your liking! \e[0m\n"
echo "LTO, PGO, Graphite is also an option (advanced)"
echo "If interested use gentoo/portage/make.conf.lto instead \n"

# Copying default make.conf
echo -e "\e[0;36mCopying /etc/portage/make.conf! \e[0m"
sleep 10
sudo cp gentoo/portage/make.conf /etc/portage/make.conf

echo -e "\e[0;36mCompiling software... \e[0m"

# Required packages
sudo emerge dev-vcs/git libXft libXinerama xorg-server rust-bin alacritty picom feh && sudo mkdir /home/$USER/.config && sudo mv config/* /home/$USER/.config

# Compiling DWM
echo -e "\e[0;36mFinished compiling! \e[0m\n"
sleep 3
echo -e "\e[0;36mCompiling DWM\e[0m"
cd /home/$USER/.config/dwm && sudo make clean install
cd /home/$USER/.config/slstatus && sudo make clean install
cd /home/$USER/.config/dmenu && sudo make clean install

# After DWM Compile
echo -e "\e[0;36mBuilt DWM and configuration copied! \e[0m"
sleep 2

# Copying xinitrc
cd /home/$USER/gentoo-setup
sudo cp .xinitrc /home/$USER/.xinitrc
sudo cp bg /usr/share/bg

# Prompt system update
echo "Update system (necessary)? [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo emerge --newuse --update --deep @world
else
        echo "Skipping..."
fi

cd /home/$USER

# Add custom .zshrc
echo "Use my custom .zshrc? [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo cp gentoo-setup/.zshrc .zshrc
	sudo emerge zsh
	chsh $USER
else
        echo "Skipping..."
fi
