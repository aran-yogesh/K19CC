provider "aws" {
  access_key = ""
  secret_key = ""
  region = "ap-south-1"
}
# Create a VPC and subnets
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_2
  tags = {
    Name = var.sb_name
  }
}

# Create a security group for the instance and allow HTTP traffic
resource "aws_security_group" "sg" {
  name_prefix = "sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = var.port
    to_port = var.port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.sg_name
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Create an EC2 instance
resource "aws_instance" "instance" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = var.ec2_name
  }
}

# Create a load balancer and attach it to the instance
resource "aws_elb" "elb" {
  name = "elb"
  subnets = [aws_subnet.subnet.id]
  listener {
    instance_port = var.port
    instance_protocol = var.protocol
    lb_port = var.port
    lb_protocol = var.protocol
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  instances = [aws_instance.instance.id]
  tags = {
    Name = var.elb_name
  }
}


# Conditions block to configure VPC
locals {
  is_vpc_enabled = true
}
