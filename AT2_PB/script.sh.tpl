#!/bin/bash
sudo yum update -y
sudo yum install nfs-utils -y
sudo mkdir -p /mnt/nfs
sudo echo "${efs_ip}:/    /mnt/nfs         nfs    defaults          0   0 " >> /etc/fstab
sudo mount -a
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose