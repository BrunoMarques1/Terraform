#!/bin/bash
# Script de User Data

# Instalar o utilitário NFS
sudo yum install -y nfs-utils

# Criar diretório de montagem
sudo mkdir -p /mnt/nfs

# Montar o EFS usando o IP do mount target
sudo mount -t nfs4 ${efs_ip}:/ /mnt/nfs

sudo mkdir /mnt/nfs/apache_logs

# Adicionar ao fstab para montagem automática no boot
echo "${efs_ip}:/ //mnt/nfs nfs defaults 0 0 " | sudo tee -a /etc/fstab
