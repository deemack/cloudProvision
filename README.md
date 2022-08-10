# cloudProvision
Vagrant to build an Ansible box which will provision a cloud VM such as a digital ocean droplet
# Steps
It is assumed to be building on VMware Workstation with Shared Folders enabled
1. clone this repo and run **vagrant up**
2. Once the machine is built, login with **vagrant:vagrant** 
3. run **sudo su* and then **cp /home/vagrant/.ssh/id_rsa.pub /mnt/vagrant-mounts/1000-1000/-vagrant/id_rsa.pub** to copy the public key to your host computer. It will be in the location where you cloned the repo.
4. goto digital ocean and create a droplet. Add the public key to the **Authentication** area.
