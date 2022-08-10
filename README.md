# cloudProvision
Vagrant to build an Ansible box which will provision a cloud VM such as a digital ocean droplet
# Steps
It is assumed to be building on VMware Workstation with Shared Folders enabled

## The Ansible VM
1. clone this repo and run **vagrant up**
2. Once the machine is built, login with **vagrant:vagrant** 
3. Run **sudo su* and then **cp /home/vagrant/.ssh/id_rsa.pub /mnt/vagrant-mounts/1000-1000/-vagrant/id_rsa.pub** to copy the public key to your host computer. It will be in the location where you cloned the repo.

## The Droplet
1. ~~goto digital ocean and create a droplet. Add the public key to the **Authentication** area.~~
2. Log in to droplet as root and run **useradd -m vagrant && passwd vagrant** and set a password.
3. Run **mkdir /home/vagrant/.ssh**
4. Run **nano /home/vagrant/.ssh/authorized_keys** and paste the public key in there.
5. Run **chmod -R go= ~/.ssh**
6. Run **chown -R vagrant:vagrant ~/.ssh**
7. Take note of the Public IP of your Droplet

## The Ansible VM
1. Run **sudo nano /etc/ansible/hosts** and add an entry for your Droplet. 
```
[droplet]
123.45.678.9
```
2. save and run **ansible droplet -m ping**
3. You should get a successul green pong.
