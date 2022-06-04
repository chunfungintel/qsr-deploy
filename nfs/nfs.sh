#!/bin/bash

FILE_PATH=/local/nfs

sudo apt update
sudo apt install nfs-kernel-server

sudo tee -a /etc/exports << EOF
$FILE_PATH *(rw,sync,no_wdelay,insecure_locks,no_root_squash,insecure,no_subtree_check)
EOF

sudo mkdir -pv $FILE_PATH
sudo chown nobody:nogroup $FILE_PATH
sudo chmod 777 $FILE_PATH

sudo exportfs -a
sudo systemctl restart nfs-kernel-server

