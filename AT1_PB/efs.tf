resource "aws_efs_file_system" "nfs" {
  creation_token = "NFS"

  tags = {
    Name = "NFS"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  file_system_id = aws_efs_file_system.nfs.id
  subnet_id = module.public_subnet01.id
  security_groups = [ module.apache_server_sg.id ]
}