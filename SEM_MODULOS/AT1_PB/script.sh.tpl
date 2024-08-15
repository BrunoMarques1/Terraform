#!/bin/bash

sudo yum install -y nfs-utils

sudo mkdir -p /mnt/nfs

sudo mount -t nfs4 ${efs_ip}:/ /mnt/nfs

sudo mkdir /mnt/nfs/apache_logs

echo "${efs_ip}:/ //mnt/nfs nfs defaults 0 0 " | sudo tee -a /etc/fstab