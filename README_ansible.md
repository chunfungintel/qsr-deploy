# QSR Deployment Guide with ansible
1. This guide provides steps to create k3s cluster and easy QSR deployment.
1. Ansible is the main tool to run installation and configuration in all machines.

## Prerequisites
1. Python 3
1. Ansible installation: `https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html`
1. GNU make
1. Create hosts inventory, refer to inventory.

## Ansible Quick Introduction
1. Ansible is popular open source device management tool.
1. For Linux machine, its main connection to device is by using SSH.
1. For ansible to doing its job, it will need playbooks which defined the desired tasks and inventory which contain device connection information.

## Inventory Setup
1. Inventory example provided in `ansible_inventory`
1. It has two main groups of devices: control-plane and worker.
1. Only 1 target is allowed in control-plane group, which will act as control-plane of k3s cluster.
1. Multiple target is allowed in worker group, which will join as worker of the k3s cluster.
1. Replace the information according:
   - `ansible_user`: user name
   - `ansible_ssh_pass`: SSH password
   - `ansible_sudo_pass`: sudo password(user must be a sudoer)

## Host configuration
1. make run SCRIPT\_FILE=basic.yaml HOST\_FILE=${PWD}/ansible\_inventory

## K3S cluster formation
1. make run SCRIPT\_FILE=k3s.yaml HOST\_FILE=${PWD}/ansible\_inventory

## Services installation with helm
1. make run SCRIPT\_FILE=helm.yaml HOST\_FILE=${PWD}/ansible\_inventory
