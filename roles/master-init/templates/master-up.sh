#!/bin/bash

kubeadm init \
  --apiserver-advertise-address {{ansible_host}} \
  --pod-network-cidr {{ansible_host}}/24 \
  --apiserver-cert-extra-sans {{ansible_hostname}}.{{common.domain_name}} \
  --service-dns-domain {{common.domain_name}}

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
