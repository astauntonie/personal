#!/bin/sh -eux

case "$PACKER_BUILDER_TYPE" in
vmware-iso|vmware-vmx)
    apt-get install -y open-vm-tools;
    mkdir -p /mnt/hgfs;
    echo "platform specific vmware.sh executed";
esac
