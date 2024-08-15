resource "aws_security_group" "efs_sg" { 
  name = "efs_sg"
  vpc_id = aws_vpc.vpc.id


  ingress {
    protocol  = "TCP"
    from_port = 2049
    to_port   = 2049
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bastion_host_sg" { 
  name = "bastion_host_sg"
  vpc_id = aws_vpc.vpc.id


  ingress {
    protocol  = "TCP"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "docker_wordpress_sg" { 
  name = "docker_wordpress_sg"
  vpc_id = aws_vpc.vpc.id


  ingress {
    protocol  = "TCP"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["${aws_instance.Bastion-Host.private_ip}/32"]
  }
  ingress {
    protocol  = "TCP"
    from_port = 2049
    to_port   = 2049
    cidr_blocks = ["${aws_efs_mount_target.mount_target.ip_address}/32"]
  }
  ingress {
    protocol  = "TCP"
    from_port = 80
    to_port   = 80
    security_groups = [aws_security_group.load_balance_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_sg" { 
  name = "rds_sg"
  vpc_id = aws_vpc.vpc.id


  ingress {
    protocol  = "TCP"
    from_port = 3306
    to_port   = 3306
    cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "load_balance_sg" { 
  name = "load_balance_sg"
  vpc_id = aws_vpc.vpc.id


  ingress {
    protocol  = "TCP"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}