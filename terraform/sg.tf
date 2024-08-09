resource "aws_security_group" "ec2_sg" {
  name = "ec2_sg"
  vpc_id = "vpc-0f735d064a7e47681"

  ingress {
    protocol  = "TCP"
    from_port = 22
    to_port   = 22
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    protocol  = "TCP"
    from_port = 111
    to_port   = 111
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol  = "UDP"
    from_port = 111
    to_port   = 111
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol  = "TCP"
    from_port = 2049
    to_port   = 2049
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol  = "UDP"
    from_port = 2049
    to_port   = 2049
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol  = "TCP"
    from_port = 80
    to_port   = 80
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol  = "TCP"
    from_port = 443
    to_port   = 443
    #cidr_blocks = ["172.30.0.0/24"]
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}