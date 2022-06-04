#!/bin/bash

curl -sfL https://get.k3s.io | sh -s - --kubelet-arg 'cgroup-driver=systemd' --docker

mkdir -p $HOME/.kube && \
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config && \
sudo chown $(id -u):$(id -g) $HOME/.kube/config

