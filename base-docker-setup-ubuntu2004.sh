#!/bin/bash

echo "Ubuntu 20.04 LTS Update & Upgrade"
sudo apt update && sudo apt upgrade -y

echo "Install Base Tools"
sudo apt install -y git curl make htop docker.io docker-compose docker docker-engine

# echo "usermod"
sudo usermod -aG docker $USER

echo "reboot"




