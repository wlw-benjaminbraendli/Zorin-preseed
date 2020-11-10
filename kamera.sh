#!/bin/bash
cd /home/user
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y curl xzcat cpio
git clone https://github.com/patjak/facetimehd-firmware.git
cd facetimehd-firmware
make
sudo make install
cd ..
sudo apt-get install -y kmod libssl-dev checkinstall dkms
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie
make
sudo make install
cd ..
sudo cp -r  bcwc_pcie /usr/src/bcwc_pcie-1.1
sudo dkms add -m  bcwc_pcie -v 1.1
sudo dkms build -m  bcwc_pcie -v 1.1
sudo dkms install -m bcwc_pcie -v 1.1
sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd
sudo sh -c 'echo "facetimehd" >> /etc/modules'
