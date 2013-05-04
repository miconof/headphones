#!/bin/bash

cd "$(dirname $0)" # quotes, to handle spaces in the path
if [ $(id -u) -eq 0 ];
then
   echo "You should run this script as a regular user"
   exit -1
fi

echo "Copying config files..."
sudo cp defaults /etc/default/headphones
sudo cp init.raspi /etc/init.d/headphones
sudo chmod 777 /etc/init.d/headphones
mkdir -p torrents

echo "Start Headphones service and add it to the default runlevel..."
sudo /etc/init.d/headphones start
sudo update-rc.d headphones defaults
