#!/usr/bin/env bash

#This script installs anisble to the VM

# Create a public and private ssh key
yes '' | ssh-keygen -N '' > /dev/null

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install ansible
sudo apt install -y ansible

# Copy Playbooks to vagrant home folder
sudo cp -R /mnt/vagrant-mounts/1000-1000/-vagrant/playbooks/ /home/vagrant/playbooks/

# Copy hosts file to vagrant home folder
sudo cp -R /mnt/vagrant-mounts/1000-1000/-vagrant/hosts /home/vagrant/hosts

# Copy pip requirements file to vagrant home folder
sudo cp /mnt/vagrant-mounts/1000-1000/-vagrant/requirements.txt /home/vagrant/requirements.txt
