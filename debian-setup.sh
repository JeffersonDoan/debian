#!/usr/bin/bash

cd ~

# Retrieve data for the setup script
#wget https://raw.githubusercontent.com/JeffersonDoan/fedora-setup/master/debian.packages

# Install repositories
sudo cp /etc/apt/sources.list{,.bak}
wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/sources.list
sudo cp sources.list /etc/apt/sources.list


# Update cache for package installs
#sudo dnf makecache

# Install TeamViewer
#sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y

# Install Joplin
#wget https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh && sudo chmod +x Joplin_install_and_update.sh && ./Joplin_install_and_update.sh

# Install packages from fedora.packages
#sudo dnf install $(cat ~/fedora.packages) -y

# Install Flatpaks from fedora.flatpak
#flatpak install flathub $(cat ~/fedora.flatpaks) -y

# Custom shell prompt with aliases - source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
#cat ~/bashrc.aliases >> ~/.bashrc

# Disable Wayland and use Xorg
#sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm/custom.conf

# Update the rest of the system
#sudo dnf update -y
