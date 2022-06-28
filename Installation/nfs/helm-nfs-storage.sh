#!/bin/bash

MASTER_IP=${1:-`hostname -I | cut -d ' ' -f1`}
FILE_PATH=${2:-/local/nfs}

echo ${MASTER_IP}
echo ${FILE_PATH}

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=$MASTER_IP \
    --set nfs.path=$FILE_PATH

kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'

