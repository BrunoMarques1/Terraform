variable "ami" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "security_groups" {
  type = list(string)
}
variable "user_data" {
  type = string
  default = null
}
variable "name" {
  type = string
}