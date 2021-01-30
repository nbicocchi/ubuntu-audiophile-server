#!/bin/bash

# render selection
echo    "************************"
echo    "* Select upnp renderer *"
echo    "************************"
echo    "* 1. mpd upmpdcli      *"
echo    "* 2. gmediarender      *"
echo    "************************"
echo -n "Select renderer (1/2)   "
read ans

RENDER=mpd
[ "$ans" == 2 ] && RENDER=gmediarender
USERNAME=$(whoami)

# external repos
sudo add-apt-repository -y ppa:jean-francois-dockes/upnpp1

# update machine
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# remove useless software
sudo apt-get -y remove packageit snap update-manager-core

# install system software
sudo apt-get -y install linux-lowlatency linux-tools-lowlatency cpufrequtils
sudo apt-get -y install openssh-server mc
sudo apt-get -y install alsa alsa-tools

# install upnp renderer
if [ $RENDER == "mpd" ]; then
  sudo apt-get -y install mpd upmpdcli
  sudo apt-get -y remove gmediarender gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools
elif [ $RENDER == "gmediarender" ]; then
  sudo apt-get -y remove mpd upmpdcli
  sudo apt-get -y install gmediarender gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools
fi

# install configurations
sudo systemctl disable ondemand
sudo adduser $USERNAME audio
sudo cp -r etc/ /
sudo sed -i "s/_USERNAME_/$USERNAME/g" /etc/default/gmediarender
sudo sed -i "s/_RENDER_/$RENDER/g" /etc/systemd/system/rc-local.service
mkdir -p /home/$USERNAME/Music

# clean up
sudo apt-get -y autoremove
sudo apt-get -y clean

# reboot
echo ""
echo "Process complete! Press any key to reboot."
read
sudo reboot
