#!/bin/bash

if [ -z "$1" ]; then
   echo 'usage: ./worker.sh <USER> <IP address>'
   exit
fi
if [ -z "$2" ]; then
   echo 'usage: ./worker.sh <USER> <IP address>'
   exit
fi
export WORKER_USER=$1
export WORKER_IP=$2


echo "Provide Control panel sudo password"
export MASTER_IP=`hostname -I | cut -d ' ' -f1`
export TOKEN=`sudo cat /var/lib/rancher/k3s/server/node-token`

echo "Provide worker ssh password then sudo password"
export K3S_URL=https://${MASTER_IP}:6443
export K3S_TOKEN=${TOKEN}
ssh $WORKER_USER@$WORKER_IP "sudo swapoff -a && sudo sed -i 's/\/swapfile/#\/swapfile/' /etc/fstab"
ssh $WORKER_USER@$WORKER_IP "curl -sfL https://get.k3s.io | K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -s - --kubelet-arg 'cgroup-driver=systemd' --docker"

