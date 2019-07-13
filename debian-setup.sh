#!/usr/bin/bash

cd ~

# Retrieve data for the setup script
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/debian.packages
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/sources.list
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2012.05.05_all.deb -O deb-multimedia-keyring.deb

# Add Firefox and multimedia key
sudo apt-key adv --keysever ha.pool.sks-keyservers.net --recv-keys 85A3D26506C4AE2A
sudo dpkg -i multimedia-keyring_all.deb

# Create backup and install repositories
sudo cp /etc/apt/sources.list{,.bak}
sudo cp ./sources.list /etc/apt/sources.list
rm ./sources.list

# Full package update
sudo apt update

# Full pack upgrade
sudo apt upgrade -y

# Install Joplin
wget https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh && sudo chmod +x Joplin_install_and_update.sh && ./Joplin_install_and_update.sh

# Install packages from debian.packages
sudo apt install $(cat ./debian.packages) -y

# Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm3/daemon.conf

# Remove Firefox ESR and GNOME Games
sudo apt remove firefox-esr -y
sudo apt autoremove gnome-games -y

# Cleanup package dependencies
sudo apt autoremove
