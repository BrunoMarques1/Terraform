resource "aws_instance" "this" {
  ami             = var.ami
  instance_type   = "t2.micro"
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  key_name = "key_pair"

  user_data = var.user_data

  tags = {
    Name = var.name
  }
}