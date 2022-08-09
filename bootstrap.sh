#!/usr/bin/env bash

#This script installs anisble to the VM

# Create a public and private ssh key
yes '' | ssh-keygen -N '' > /dev/null

# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install ansible
sudo apt install -y ansible