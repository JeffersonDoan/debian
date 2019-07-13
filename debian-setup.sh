#!/usr/bin/bash

cd ~

# Retrieve data for the setup script
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/debian.packages
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/sources.list
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb

# Add Firefox, Spotify, and Multimedia key
sudo apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 85A3D26506C4AE2A
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 
sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb

# Create backup and install repositories
sudo cp /etc/apt/sources.list{,.bak}
sudo cp ./sources.list /etc/apt/sources.list
rm ./sources.list

# Add 32bit arch (Package support)
sudo dpkg --add-architecture i386

# Full package update
sudo apt update

# Full pack upgrade
sudo apt dist-upgrade -y

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
