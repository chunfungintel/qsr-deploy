# QSR Deployment Guide

## Host setup
1. Disable password asking: echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo EDITOR='tee -a' visudo
1. NFS client installation: sudo apt install -y nfs-common

## Docker installation
1. Go into directory: cd Installation/Docker
1. Docker installation: ./docker-install.sh
1. Docker configurations: ./docker-configure.sh

## k3s installation
### Control panel node
1. Go into directory: Installation/k3s
1. Control panel setup: ./control-panel.sh
### Worker node
1. Go into directory: Installation/k3s
1. Run script by providing worker node user name and ip address: ./worker.sh \<USER\> \<IP address\>

## NFS installation at control panel as k3s storage class
1. Go into directory: Installation/nfs
1. NFS installation: ./nfs.sh
1. helm installation: ./helm.sh
1. Install nfs helm chart: ./helm-nfs-storage.sh

## Mosquitto
1. Deployment: helm install --create-namespace -n mqtt mosquitto mosquitto
1. Upgrading: helm upgrade --install -n mqtt mosquitto mosquitto
1. Delete: helm uninstall -n mqtt mosquitto

## QSR deployment
1. Update MASTER\_IP in qsr/values.yaml: sed -i 's/MASTER\_IP/<MASTER IP ADDRESS>/g' qsr/values.yaml
1. Create QSR stack: helm install --debug --create-namespace -n qsr qsr qsr
1. Create database name "qsr" for mysql pods.
