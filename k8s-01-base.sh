#!/bin/bash

# Props to this guide:
# https://blog.bobbyallen.me/2020/03/01/deploying-your-own-kubernetes-k8s-bare-metal-cluster/

sudo sysctl -w net.ipv4.ip_forward=1
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

sudo swapoff -a
sudo sed -i '2s/^/#/' /etc/fstab

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get update
sudo apt-get install kubernetes-cni -y
sudo apt-get install kubelet kubeadm kubectl -y


sudo apt-mark hold kubernetes-cni kubelet kubeadm kubectl docker

sudo systemctl daemon-reload
sudo systemctl restart kubelet

sudo mkdir -p /etc/kubernetes

wget https://blog.bobbyallen.me/wp-content/uploads/2020/02/audit-policy.txt && sudo mv audit-policy.txt /etc/kubernetes/audit-policy.yaml
sudo chown root:root /etc/kubernetes/audit-policy.yaml
sudo chmod 0600 /etc/kubernetes/audit-policy.yaml

sudo mkdir -p /var/log/kubernetes/audit

sudo apt-get install nfs-common -y

echo sudo reboot
