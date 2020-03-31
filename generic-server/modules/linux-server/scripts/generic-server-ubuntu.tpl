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