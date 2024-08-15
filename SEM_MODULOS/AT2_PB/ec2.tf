resource "aws_instance" "Bastion-Host" {
  ami             = "ami-0ae8f15ae66fe8cda"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet01.id
  security_groups = [aws_security_group.bastion_host_sg.id]
  key_name = "key_pair"

  tags = {
    Name = "Bastion-Host"
  }
}

resource "aws_instance" "Docker-Wordpress" {
  ami             = "ami-0ae8f15ae66fe8cda"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.private_subnet01.id
  security_groups = [aws_security_group.docker_wordpress_sg.id]
  key_name = "key_pair"
  db_name = module.rds1.db_name

  user_data = templatefile("${path.module}/script.sh.tpl", {
    efs_ip = aws_efs_mount_target.mount_target.ip_address
  })


  tags = {
    Name = "Docker-Wordpress"
  }
}