#! /bin/bash
echo "clean system upgrade with purge :"
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove --purge
sudo apt-get clean
