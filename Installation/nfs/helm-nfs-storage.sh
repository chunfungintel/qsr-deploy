#!/bin/bash

FILE_PATH=/local/nfs
MASTER_IP=`hostname -I | cut -d ' ' -f1`

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=$MASTER_IP \
    --set nfs.path=$FILE_PATH

