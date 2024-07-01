#!/bin/bash

sudo add-apt-repository -y multiverse
sudo dpkg --add-architecture i386
sudo apt update

echo steam steam/question select "I AGREE" | sudo debconf-set-selections
echo steam steam/license note '' | sudo debconf-set-selections

sudo apt install -y steamcmd

/usr/games/steamcmd +force_install_dir /home/ubuntu/TSU +login anonymous +app_update ${app_id} validate +quit

mkdir -p /home/ubuntu/.steam/sdk64/
cp /home/ubuntu/TSU/linux64/steamclient.so /home/ubuntu/.steam/sdk64/

chown -R ubuntu:ubuntu /home/ubuntu/TSU

sudo -u ubuntu sh -c "/home/ubuntu/TSU/TSUs.x86_64 -name "${server_name}" -admin ${admins} -public -relay > /home/ubuntu/server.log 2>&1 &"
