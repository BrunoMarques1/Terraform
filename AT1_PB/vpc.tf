module "vpc" {
  source = "./modulos/vpc"
  vpc_cidr           = "10.0.0.0/16"
  vpc_name           = "VPC"
}
module "public_subnet01" {
  source = "./modulos/public_subnet"
  vpc_id = module.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.id

  tags = {
    Name = "IGW"
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
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = module.public_subnet01.id
  route_table_id = aws_route_table.public_rt.id
}
