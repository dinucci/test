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

## Install Kubectl
## https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client

##  Install Minikube

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

minikube start --driver=virtualbox

