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
1. Log in to droplet as root and run **useradd -m vagrant && passwd vagrant** and set a password.
2. Run **mkdir /home/vagrant/.ssh**
3. Run **nano /home/vagrant/.ssh/authorized_keys** and paste the public key in there.
4. Run **chmod -R go= ~/.ssh**
5. Run **chown -R vagrant:vagrant ~/.ssh**
6. Run **passwd root** and set the root password.
7. Run **usermod -aG sudo vagrant** to add vagrant to the sudoers group.
8. Take note of the Public IP of your Droplet

### The Ansible VM
1. Run **nano /home/vagrant/hosts** and add an entry for your Droplet. 
```
[droplet]
123.45.678.9
```
2. save and run **ansible -i hosts all -m ping**
3. You should get a successul green pong.
4. You can run a playbook from the **vagrant** home directory to update your droplet with the command **ansible-playbook playbooks/update.yml -K**. The capital **K** flag is used to prompt for the **BECOME** password so that the commands can be executed as root.
