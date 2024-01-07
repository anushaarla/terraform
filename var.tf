variable "ami" {
  type     = string
  default = ""
}
variable "type" {
}
variable "key_name" {
}
variable "subnet_id" {
}
variable "rt_cidr" {
}
variable "subnet-cidr" {
}
variable "cidr_block" {
}
variable "ingress" {
    default=[22,80,8080]
}
variable "allow_all" {
    default="0.0.0.0/0"
}
variable "server_name" {
}
