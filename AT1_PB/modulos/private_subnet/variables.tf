variable "vpc_id" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "name" {
  type = string
  default = "private_subnet"
}
variable "map_public_ip_on_launch" {
  type = bool
  default = false
}