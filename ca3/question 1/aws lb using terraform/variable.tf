variable "cidr_block" {
  type = string
 }
variable "cidr_2" {
  type = string
}
variable "port" {
  type = number
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "protocol" {
  type = string 
}
variable "igw_name" {
  type = string
}
variable "ec2_name" {
  type = string  
}
variable "vpc_name" {
  type = string
}
variable "sg_name" {
  type = string
}
variable "sb_name" {
  type=string
}
variable "elb_name" {
  type = string
}