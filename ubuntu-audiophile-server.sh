#!/bin/bash

# software selection
echo -n "Install gmediarender (y/n)? "
read gmediarender

echo -n "Install mpd (y/n)? "
read mpd

echo -n "Install upmpdcli (upnp mpd integration, no seeking supported) (y/n)? "
read upmpdcli

# external repos
sudo add-apt-repository -y ppa:jean-francois-dockes/upnpp1

# update machine
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# remove useless software
sudo apt-get -y remove packageit snap update-manager-core

# install system software
sudo apt-get -y install linux-lowlatency linux-tools-lowlatency cpufrequtils
sudo apt-get -y install openssh-server mc net-tools
sudo apt-get -y install alsa alsa-tools

# remove previous installations
sudo apt-get -y remove mpd mpc
sudo apt-get -y remove upmpdcli
sudo apt-get -y remove gmediarender gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools

# install software
[ $mpd == "y" ] && sudo apt-get -y install mpd mpc
[ $upmpdcli == "y" ] && sudo apt-get -y install upmpdcli
[ $gmediarender == "y" ] && sudo apt-get -y install gmediarender gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools

# install configurations
USERNAME=$(whoami)
mkdir -p /home/$USERNAME/Music
sudo cp -r etc/ /
sudo sed -i "s/_USERNAME_/$USERNAME/g" /etc/mpd.conf
sudo systemctl disable ondemand
sudo systemctl enable mpd-renice.service
sudo systemctl enable gmediarender-renice.service

# clean up
sudo apt-get -y autoremove
sudo apt-get -y clean

# reboot
echo ""
echo "Process complete! Press any key to reboot."
read
sudo reboot
