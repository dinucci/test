# test
Minikube / Docker
Testing Environments for quick deployment

user: test
Change to whatever you want.

Kubernetes/Minikube tools for quick Dev/Test environments based on Ubuntu 18.04 LTS

Virtualization Driver: VirtualBox

Requirements:
 - Clean Ubuntu 18.04 LTS Installation
 - CPU:
    - Intel: VT-X Enabled
    - AMD: VM-X Enabled
          - Virtualization Driver: Disabled
                  -- Run Docker Instead
Specs:
 - OS Update / Upgrade: Auto
 - OS Reboot: Manual
 - Virtualization Driver Set up: Auto
 - OS Reboot: Manual
 - Minikube Set up & Run: Auto
 - minukube get services: Manual
 - minikube delete: Manual :)
 
Steps:

 - 1- Clone this repository
   - git clone ....

 - 2- Enter test repository
   - cd test

 - 3- Update OS and Set Up VirtualBox 6.1
   - chmod +x virtualbox-6.1-ubuntu1804-setup.sh
   - ./virtualbox-6.1-ubuntu1804-setup.sh

 - 4- Reboot OS
   - sudo reboot

 - 5- Install Kubectl+Minikube & Run Minikube with VirtualBox driver
   - chmod +x minikube-vbox-ubuntu1804-setup.sh
   - ./minikube-vbox-ubuntu1804-setup.sh

 - 6- Verify installation
   - kubectl get services

 - 7- If Installation fails because of drivers, Delete Minikube and proceed to Docker Setup.
   - minikube delete

------------------

Docker Engine Version

Script based on https://docs.docker.com/engine/install/ubuntu

It removes prior docker installations and install clean ones from the Official Repository.
This script is for user 'test', feel free to change it to the same of the OS you're running or execute at the end: 
sudo usermod -aG docker youruser

Requirements:
 - Ubuntu 18.04

Steps:
 - 1- Install Docker Engine
   - chmod +x docker-ubuntu1804-setup.sh
   - ./docker-ubuntu1804-setup.sh

 - 2- Reboot OS
   - sudo reboot

 - 3- Minikube/Docker Driver Set Up
   - chmod +x minikube-docker-ubuntu18.04-setup.sh
   - ./minikube-docker-ubuntu18.04-setup.sh

 - 4- Verify installation
   - kubectl get services



