# An Ansible VM to provision a Droplet
The purpose of this project is to create an Ansible VM with Vagrant, and use it to provision a Droplet.

# Assumptions
1. You have set up VMWorkstation on you host PC.
2. You have set up Vagrant on your host PC.
3. You have an account with Digital Ocean and are able to create Droplets.

### The Ansible VM
1. clone this repo and run **vagrant up**
2. Once the machine is built, login with **vagrant:vagrant** 
3. Run **sudo su** and then **cp /home/vagrant/.ssh/id_rsa.pub /mnt/vagrant-mounts/1000-1000/-vagrant/id_rsa.pub** to copy the public key to your host computer. It will be in the location where you cloned the repo.

### The Droplet
1. Log in to droplet as root and run the following
```
useradd -m vagrant && passwd vagrant
mkdir /home/vagrant/.ssh
nano /home/vagrant/.ssh/authorized_keys
```
2. Paste the public key in there.
```
chmod -R go= ~/.ssh
chown -R vagrant:vagrant ~/.ssh
passwd root 
usermod -aG sudo vagrant
```
3. Take note of the Public IP of your Droplet

### The Ansible VM
1. Run the following command to add an entry for your Droplet. 
```
nano /home/vagrant/hosts
```
2. Write the name and IP for this group of machines, and then save.
```
[droplet]
123.45.678.9
```
2. To test a successful SSH connection from the Ansible machine to the Droplet run the following command:
```ansible -i hosts all -m ping
'''
3. You should get a successul green pong.
4. You can run a playbook from the **vagrant** home directory to update your droplet with the command:
```
ansible-playbook -i hosts playbooks/update.yml -K
```
The capital **K** flag is used to prompt for the **BECOME** password so that the commands can be executed as root.
