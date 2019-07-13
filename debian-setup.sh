#!/usr/bin/bash

cd ~

# Retrieve data for the setup script
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/debian.packages
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/sources.list

# Add Firefox key
sudo apt-key adv --keysever ha.pool.sks-keyservers.net --recv-keys 85A3D26506C4AE2A

# Create backup and install repositories
sudo cp /etc/apt/sources.list{,.bak}
sudo cp ./sources.list /etc/apt/sources.list
rm ./sources.list


# Update to install multimedia keyring
sudo apt update -oAcquire::AllowInsecureRepositories=true

# Install multimedia keyring
sudo apt install deb-multimedia-keyring -y

# Full package update
sudo apt update

# Full pack upgrade
sudo apt upgrade -y

# Install Joplin
wget https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh && sudo chmod +x Joplin_install_and_update.sh && ./Joplin_install_and_update.sh

# Install packages from debian.packages
sudo apt install $(cat ~/debian.packages) -y

# Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm3/daemon.conf

# Remove Firefox ESR and GNOME Games
sudo apt remove firefox-esr -y
sudo apt autoremove gnome-games -y

# Cleanup package dependencies
sudo apt autoremove
