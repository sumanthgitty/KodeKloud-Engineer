# VPC
resource "aws_vpc" "vpc" {
  cidr_block       = var.KKE_VPC_CIDR
  instance_tenancy = "default"

  tags = {
    Name = "nautilus-priv-vpc"
  }
}

# Subnet
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.KKE_SUBNET_CIDR
  map_public_ip_on_launch = false   # auto-assign IP disabled

  tags = {
    Name = "nautilus-priv-subnet"
  }
}

# Security Group (restrict access only to VPC CIDR)
resource "aws_security_group" "priv_sg" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nautilus-priv-sg"
  }
}

# EC2 Instance
resource "aws_instance" "example" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 in us-east-1
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.priv_sg.id]

  tags = {
    Name = "nautilus-priv-ec2"
  }
}