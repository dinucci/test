#!/bin/bash
set -euo pipefail

## Add VirtualBox repos
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee -a /etc/apt/sources.list

## Update OS

sudo apt update && sudo apt upgrade -y

## Verify VMX/SVM
grep -E --color 'vmx|svm' /proc/cpuinfo
sleep 5

## Install VirtualBox
sudo apt update
sleep 1
sudo apt install virtualbox-6.1 -y
sleep 5
