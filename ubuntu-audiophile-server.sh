#!/bin/bash

USERNAME=$(whoami)

# external repos
sudo add-apt-repository -y ppa:jean-francois-dockes/upnpp1

# update machine
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# remove useless software
sudo apt-get -y remove packageit snap update-manager-core

# install software 
sudo apt-get -y install openssh-server
sudo apt-get -y install mpd upmpdcli 
sudo apt-get -y install alsa alsa-tools
sudo apt-get -y install linux-lowlatency linux-tools-lowlatency cpufrequtils

# install configurations
sudo systemctl disable ondemand
sudo adduser "$USERNAME" audio
sudo cp -r etc/ /
mkdir -p /home/"$USERNAME"/Music

# clean up
sudo apt-get -y autoremove
sudo apt-get -y clean

# reboot
echo ""
echo "Process complete! Press any key to reboot."
read
#sudo reboot