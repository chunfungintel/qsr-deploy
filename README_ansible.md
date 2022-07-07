# QSR Deployment Guide with ansible
1. This guide provides steps to create k3s cluster and easy QSR deployment.
1. Ansible is the main tool to run installation and configuration in all machines.

## Prerequisites
1. Python 3
1. Ansible installation: `https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html`
1. GNU make
1. Create hosts inventory, refer to inventory.

## Host configuration
1. make run SCRIPT\_FILE=basic.yaml HOST\_FILE=${PWD}/ansible\_inventory

## K3S cluster formation
1. make run SCRIPT\_FILE=k3s.yaml HOST\_FILE=${PWD}/ansible\_inventory

## Services installation with helm
1. make run SCRIPT\_FILE=helm.yaml HOST\_FILE=${PWD}/ansible\_inventory
