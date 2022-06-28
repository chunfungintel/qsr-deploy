#!/bin/bash

if [ -z "$1" ]; then
   echo 'usage: ./worker_ansible.sh <Control panel IP> <Token>'
   exit
fi
if [ -z "$2" ]; then
   echo 'usage: ./worker_ansible.sh <Control panel IP> <Token>'
   exit
fi

export MASTER_IP=$1
export TOKEN=$2

export K3S_URL=https://${MASTER_IP}:6443
export K3S_TOKEN=${TOKEN}
sudo swapoff -a && sudo sed -i 's/\/swapfile/#\/swapfile/' /etc/fstab
curl -sfL https://get.k3s.io | K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -s - --kubelet-arg 'cgroup-driver=systemd' --docker

