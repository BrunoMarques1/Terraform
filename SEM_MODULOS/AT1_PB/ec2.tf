#resource "aws_instance" "web_server" {
#  ami             = "ami-0dfdffe179243455b"
#  instance_type   = "t2.micro"
#  subnet_id       = aws_subnet.public_subnet.id
#  security_groups = [aws_security_group.ec2_sg.id]
#  key_name = "key_pair"
#
#  user_data = templatefile("${path.module}/script.sh.tpl", {
#    efs_ip = aws_efs_mount_target.mount_target.ip_address
#  })
#
#  tags = {
#    Name = "Web-Server-Apache"
#  }
#}

module "ec2_01"{
  source = "./modulos/ec2"

  instance_name = "Web_Server_Apache"
  ami = "ami-0dfdffe179243455b"
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ec2_sg.id]
  
  user_data = templatefile("${path.module}/script.sh.tpl", {
    efs_ip = aws_efs_mount_target.mount_target.ip_address
  })
}
#module "ec2_02"{
#  source = "./modulos/ec2"
#
#  instance_name = "Amazon_Linux"
#  ami = "ami-0c8e23f950c7725b9"
#  subnet_id       = aws_subnet.public_subnet.id
#  security_groups = [aws_security_group.ec2_sg.id]
#}