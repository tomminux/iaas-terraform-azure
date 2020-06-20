#!/bin/bash

### ..:: Update this Ubuntu installation ::..
### ---------------------------------------------------------------------------
echo "--> Updating and upgrading this Ubuntu installation"
apt update
DEBIAN_FRONTEND=noninteractive apt upgrade -y
DEBIAN_FRONTEND=noninteractive apt install apt-transport-https ca-certificates curl software-properties-common -y

### ..:: Install k8s ::..
### ---------------------------------------------------------------------------
echo "--> Installing k8s software"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

### ..:: Install Docker ::..
### ---------------------------------------------------------------------------
echo "--> Installing Docker layer"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
DEBIAN_FRONTEND=noninteractive apt install docker-ce kubectl -y
usermod -aG docker ubuntu

### ..:: Install Docker ::..
### ---------------------------------------------------------------------------
echo "--> Installing Ansible"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt-add-repository "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main"
DEBIAN_FRONTEND=noninteractive apt update
DEBIAN_FRONTEND=noninteractive apt install ansible -y
sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg