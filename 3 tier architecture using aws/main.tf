provider "aws" {

    access_key = ""
    secret_key = ""
  region = "us-west-2"
}

resource "aws_vpc" "web_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "web_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.web_vpc.id
}

resource "aws_lb" "web_alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.web_subnet.id]

  access_logs {
    bucket  = "web-alb-logs"
    prefix  = "web-alb"
    enabled = true
  }
}


resource "aws_launch_configuration" "web_lc" {
  name                 = "11903273"
  image_id             = ""
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > /var/www/html/index.html
              EOF
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"
  vpc_id      = aws_vpc.web_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_route53_record" "web_record" {
  zone_id = "E"
  name    = "11903273.com"
  type    = "A"

  alias {
    name                   = aws_lb.web_alb.dns_name
    zone_id                = aws_lb.web_alb.zone_id
    evaluate_target_health = true
  }
}
