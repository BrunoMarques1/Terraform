module "apache_server_sg" {
  source = "./modulos/sg"

  name = "apache_server_sg"
  vpc_id = module.vpc.id

  ingress_rules = [ 
    {
    protocol  = "TCP"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"] 
    },
    {
    protocol  = "TCP"
    from_port = 111
    to_port   = 111
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    protocol  = "UDP"
    from_port = 111
    to_port   = 111
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    protocol  = "TCP"
    from_port = 2049
    to_port   = 2049
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    protocol  = "UDP"
    from_port = 2049
    to_port   = 2049
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    protocol  = "TCP"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
    },
    {
    protocol  = "TCP"
    from_port = 443
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
    }
   ]

  egress_rules = [ 
    {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    }
   ]

  tags = {
    Project     = "Apache"
  }
}