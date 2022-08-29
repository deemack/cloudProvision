#!/usr/bin/env bash

#This script installs anisble to the VM

# Create a public and private ssh key
yes '' | ssh-keygen -N '' > /dev/null

# Update and upgrade packages
sudo apt-get update && sudo apt-get upgrade -y

# Install ansible
sudo apt-get install -y ansible

# Copy Playbooks to vagrant home folder
sudo cp -R /vagrant/playbooks/ /home/vagrant/playbooks/

# Copy hosts file to vagrant home folder
sudo cp -R /vagrant/hosts /home/vagrant/hosts

# Copy pip requirements file to vagrant home folder
sudo cp /vagrant/requirements.txt /home/vagrant/requirements.txt

# Copy tomcat config files to vagrant home folder
sudo mkdir /home/vagrant/temp
sudo cp -R /vagrant/config/* /home/vagrant/temp/

