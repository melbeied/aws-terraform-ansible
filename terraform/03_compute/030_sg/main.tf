resource "aws_security_group" "SG_public_22_80_443" {
  name        = "SG_public_80_443"
  description = "Port 22, 80, 443 from all world"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    description = "worldwide"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    description = "worldwide"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    description = "worldwide"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "SG_public_22_80_443"
  }
}


resource "aws_security_group" "SG_front_22_80_443" {
  name        = "SG_front_80_443"
  description = "Port 22, 80, 443 from vpc subnet"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    description = "vpc flow"
    cidr_blocks = [var.vpc_cidr]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    description = "vpc flow"
    cidr_blocks = [var.vpc_cidr]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    description = "vpc flow"
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name        = "SG_front_22_80_443"
  }
}

resource "aws_security_group" "SG_back_22_3306" {
  name        = "SG_back_80_443"
  description = "Port 22, 3306 from vpc subnet"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    description = "vpc"
    cidr_blocks = [var.vpc_cidr]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "TCP"
    description = "vpc"
    cidr_blocks = [var.vpc_cidr]
  }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name        = "SG_back_22_3306"
  }
}