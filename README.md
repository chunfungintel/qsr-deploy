# QSR Deployment Guide

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
1. Run script by providing worker node user name and ip address: ./worker.sh <USER> <IP address>

## Mosquitto
1. Deployment: helm install --create-namespace -n mqtt mosquitto mosquitto
1. Upgrading: helm upgrade --install -n mqtt mosquitto mosquitto
1. Delete: helm uninstall -n mqtt mosquitto
