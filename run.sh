#!/bin/bash
# Ethereum miner for Microsoft Azure
# Script by Ben Thompson
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install gcc g++ build-essential libssl-dev automake linux-headers-$(uname -r) git gawk libcurl4-openssl-dev libjansson-dev xorg libc++-dev libgmp-dev python-dev -y

echo -e "\e[31;43m***** Installing Drivers and Prerequisites *****\e[0m"
sudo apt-get install software-properties-common gcc make build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget bsdmainutils automake -y
sudo add-apt-repository ppa:ethereum/ethereum -y
sudo apt-get update -y
sudo apt-get install ethereum ethminer geth build-essential -y
wget http://uk.download.nvidia.com/XFree86/Linux-x86_64/375.26/NVIDIA-Linux-x86_64-375.26.run
sudo chmod +x NVIDIA-Linux-x86_64-375.26.run
sudo ./NVIDIA-Linux-x86_64-375.26.run --accept-license --no-questions --no-install-compat32-libs
echo -e "\e[31;43m***** Done! To start mining do: 'ethminer -G -F YOURPOOL --farm-recheck 200' *****\e[0m"
wget http://uk.download.nvidia.com/XFree86/Linux-x86_64/375.26/NVIDIA-Linux-x86_64-375.26.run
sudo chmod +x NVIDIA-Linux-x86_64-375.26.run
sudo ./NVIDIA-Linux-x86_64-375.26.run --accept-license --no-questions --no-install-compat32-libs
wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
sudo apt-get update -y
sudo apt-get install cuda-toolkit-8-0 -y
sudo usermod -a -G video $USER
echo "" >> ~/.bashrc
echo "export PATH=/usr/local/cuda-8.0/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda8.0/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
sudo ln -s /usr/local/cuda/bin/nvcc /sbin/nvcc
git clone https://github.com/tpruvot/ccminer.git
cd ccminer
./autogen.sh
./configure
make -j$(nproc)
sudo make install -j$(nproc)
echo -e "\e[31;43m***** Done! *****\e[0m"
