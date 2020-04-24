#!/bin/bash
set -euo pipefail

# Install Docker Engine
# https://docs.docker.com/engine/install/ubuntu/

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

## Add Docker's GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -



# Add to repos

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

# Allow Non Root
sudo usermod -aG docker test

# Reboot