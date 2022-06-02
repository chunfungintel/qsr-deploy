# QSR Deployment Guide

## Mosquitto
1. Deployment: helm install --create-namespace -n mqtt mosquitto mosquitto
1. Upgrading: helm upgrade --install -n mqtt mosquitto mosquitto
1. Delete: helm uninstall -n mqtt mosquitto
