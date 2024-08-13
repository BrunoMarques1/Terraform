resource "aws_instance" "web_server" {
  ami             = "ami-034547d56642a9dac"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ec2_sg.id]
  key_name = "key_pair"


  tags = {
    Name = "Web-Server_Apache"
  }
}