#!/usr/bin/env bash

#dnf install -y container-tools podman podman-docker podman-plugins podman-compose;

dnf config-manager --disable https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker
usermod -aG docker vagrant