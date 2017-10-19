#!/bin/bash
# Ethereum miner for Microsoft Azure
# Script by Ben Thompson
echo -e "\e[31;43m***** Installing Drivers and Prerequisites *****\e[0m"
sudo apt-get install software-properties-common gcc make -y
sudo add-apt-repository ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum ethminer geth build-essential -y
wget http://us.download.nvidia.com/tesla/384.81/NVIDIA-Linux-x86_64-384.81.run
sudo chmod +x NVIDIA-Linux-x86_64-384.81.run
sudo ./NVIDIA-Linux-x86_64-384.81.run --accept-license --no-questions --no-install-compat32-libs
echo -e "\e[31;43m***** Generating Wallet: *****\e[0m"
geth account new
echo -e "\e[31;43m***** Done! To start mining do: 'ethminer -G -F YOURPOOL --farm-recheck 200' *****\e[0m"
