variable "instance_name" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "subnet_id" {
  type = string
}
variable "key_name" {
  type = string
  default = "key_pair"
}
variable "security_groups" {
  type = list
}
variable "user_data" {
  type = string
  default = null
}