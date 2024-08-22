resource "aws_efs_file_system" "nfs" {
  creation_token = "NFS"

  tags = {
    Name = "NFS"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  file_system_id = aws_efs_file_system.nfs.id
  subnet_id = module.public_subnet01.id
  security_groups = [ aws_security_group.efs_sg.id ]
}
#resource "aws_efs_mount_target" "mount_target" {
#  file_system_id = aws_efs_file_system.nfs.id
#  subnet_id = aws_subnet.public_subnet02.id
#  security_groups = [ aws_security_group.efs_sg.id ]
#}