resource "aws_efs_file_system" "nfs" {
  creation_token = "NFS"

  tags = {
    Name = "NFS"
  }
}