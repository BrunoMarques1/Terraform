resource "aws_efs_file_system" "nfs" {
  creation_token = "NFS"

  tags = {
    Name = "NFS"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  file_system_id = aws_efs_file_system.nfs.id
  subnet_id = aws_subnet.public_subnet.id
  security_groups = [ aws_security_group.ec2_sg.id ]
}