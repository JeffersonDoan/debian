# Debian 10 Buster Setup
Setup script for Debian 10 Buster.

Enter the following command in the terminal to run the script:

`wget https://raw.githubusercontent.com/JeffersonDoan/debian/master/setup.sh && sudo chmod +x setup.sh && ./setup.sh`

This script will:
1. Install repositories (Main, Updates, Security, Backports, Multimedia, and Firefox Testing)
2. Install packages via APT (including NVIDIA driver)
3. Install Joplin via shell script
4. Uninstall Firefox ESR (newer package installed)
5. Uninstall GNOME Games (...)
6. Disable Wayland and use Xorg for Graphics
7. Update the rest of the system packages
8. Remove extra files during setup

Run `rm ./setup.sh` after the setup is finished to delete the script.

## TO DO:
1. Install Discord automatically
2. Install Bitwarden automatically
