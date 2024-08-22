module "bastion_host" {
  source = "./modulos/ec2"
  ami = "ami-0ae8f15ae66fe8cda"
  subnet_id = module.public_subnet01.id
  security_groups = [ aws_security_group.bastion_host_sg.id ]
  name = "Bastion-Host"
}
module "docker_wordpress" {
  source = "./modulos/ec2"
  ami = "ami-0ae8f15ae66fe8cda"
  subnet_id = module.private_subnet01.id
  security_groups = [ aws_security_group.docker_wordpress_sg.id ]
  name = "Docker-Wordpress"
  user_data = templatefile("${path.module}/script.sh.tpl", {
    efs_ip = aws_efs_mount_target.mount_target.ip_address
  })
}
