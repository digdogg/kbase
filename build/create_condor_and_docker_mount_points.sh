#!/bin/bash
set -o xtrace

pvcreate /dev/vdb

vgcreate data /dev/vdb

lvcreate -n docker -L200GB data

lvcreate -n condor -L731.50GB data

mkfs.xfs /dev/mapper/data-condor 
mkfs.xfs /dev/mapper/data-docker

mkdir -pv /mnt/awe/condor

chmod 777 /mnt/awe/condor/


wget -O /etc/fstab https://gist.githubusercontent.com/digdogg/c3d5ea0c7e136745f9efb42775ed9ff3/raw/069c5b038d36b4cd4b1552bf09cad634ad0b775c/fstab

mount -av
mount --bind /mnt/awe/condor /mnt/condor

lvs
