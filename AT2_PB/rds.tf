# Criar o grupo de sub-redes do banco de dados
resource "aws_db_subnet_group" "RDS-subnet-group" {
  name       = "rds-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet01.id,
    aws_subnet.private_subnet02.id
  ]

  tags = {
    Name = "RDS Subnet Group"
  }
}

# Criar o Banco de Dados MySQL
resource "aws_db_instance" "wordpressdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "wp_db"
  username             = "admin"
  password             = "password123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.RDS-subnet-group.name
  publicly_accessible    = true
  availability_zone      = "us-east-1a"  # Opção de disponibilidade para a instância

  performance_insights_enabled = false
}