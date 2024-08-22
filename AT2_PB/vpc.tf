module "vpc" {
  source     = "./modulos/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "VPC"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.id

  tags = {
    Name = "IGW"
  }
}
resource "aws_eip" "nat_eip" {
  vpc = true
}
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = module.public_subnet01.id
  depends_on    = [aws_internet_gateway.igw]

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = module.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = module.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

module "public_subnet01" {
  source            = "./modulos/public_subnet"
  vpc_id            = module.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  name              = "public_subnet01"
  route_table_id    = aws_route_table.public_rt.id
}
module "public_subnet02" {
  source            = "./modulos/public_subnet"
  vpc_id            = module.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  name              = "public_subnet02"
  route_table_id    = aws_route_table.public_rt.id
}
module "private_subnet01" {
  source            = "./modulos/private_subnet"
  vpc_id            = module.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  name              = "private_subnet01"
  route_table_id    = aws_route_table.private_rt.id
}
module "private_subnet02" {
  source            = "./modulos/private_subnet"
  vpc_id            = module.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  name              = "private_subnet02"
  route_table_id    = aws_route_table.private_rt.id
}

#resource "aws_route_table_association" "public_assoc01" {
#  subnet_id      = module.public_subnet01.id
#  route_table_id = aws_route_table.public_rt.id
#}
#resource "aws_route_table_association" "public_assoc02" {
#  subnet_id      = aws_subnet.public_subnet02.id
#  route_table_id = aws_route_table.public_rt.id
#}
#resource "aws_route_table_association" "private_assoc01" {
#  subnet_id      = aws_subnet.private_subnet01.id
#  route_table_id = aws_route_table.private_rt.id
#}
#resource "aws_route_table_association" "private_assoc02" {
#  subnet_id      = aws_subnet.private_subnet02.id
#  route_table_id = aws_route_table.private_rt.id
#}
