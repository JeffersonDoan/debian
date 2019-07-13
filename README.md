# debian-setup
Setup script for Debian

Enter the following command in the terminal to run the script:

`wget https://raw.githubusercontent.com/JeffersonDoan/debian-setup/master/debian-setup.sh && sudo chmod +x debian-setup.sh && ./debian-setup.sh`

This script will:
1. Install repositories (Main, Updates, Security, Backports, Multimedia, and Firefox Testing)
3. Install Joplin via shell script
4. Install packages via APT (including NVIDIA driver)
6. Disable Wayland and use Xorg for Graphics
7. Update the rest of the system packages
