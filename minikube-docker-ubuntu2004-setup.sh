#!/bin/bash
set -euo pipefail

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

minikube start --driver=docker --cpus=4 --memory=4096

  
  
## Install Helm
echo "curl get Helm script"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
echo "assign execution attributes to get_helm.sh"
chmod 700 get_helm.sh
echo "runs get_helm script"
./get_helm.sh
echo "execution finished"

echo "adds bitnami repo"
#helm repo add bitnami https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm repo add bitnami https://charts.bitnami.com/bitnami


echo "updates helm"
helm update

echo "helm updated"
sleep 3
echo "after 3 seconds, install bitnami/wordpress"

helm install bitnami-wp bitnami/wordpress




