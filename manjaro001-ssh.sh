#!/bin/bash

sudo pacman -Syuu

sudo systemctl status sshd.service
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
sudo systemctl status sshd.service


sudo ufw status
sudo ufw enable
sudo ufw allow 22
sudo ufw status

