variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Web-Server"
}


resource "aws_instance" "app_server" {
  ami             = "ami-0ae8f15ae66fe8cda"
  instance_type   = "t2.micro"
  subnet_id       = "subnet-0e774948250cc2484"
  security_groups = ["sg-0335a3ecc5bf9b66b"]
  key_name = "key_pair"

  tags = {
    Name = var.instance_name
  }
}