### Terraform AWS Tasks – Infrastructure Setup for Migration
This repository contains Terraform configurations developed to support the phased cloud migration plan of the Nautilus DevOps team. These tasks represent the foundational steps for provisioning and managing AWS resources using Terraform, enabling a reliable and automated infrastructure-as-code workflow.

Each task below outlines a specific infrastructure requirement and includes the corresponding Terraform configuration necessary to accomplish it.

#### 1. Generate an EC2 Key Pair Using Terraform
Create a key pair in AWS for SSH access to EC2 instances using Terraform.

Solution - 
```sh
resource "tls_private_key" "xfusion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "xfusion_kp" {
  key_name   = "xfusion-kp"
  public_key = tls_private_key.xfusion_key.public_key_openssh
}

resource "local_file" "private_key" {
  content              = tls_private_key.xfusion_key.private_key_pem
  filename             = "/home/bob/xfusion-kp.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}
```
---
#### 2. Create a Security Group for EC2
Define a security group to allow inbound SSH access and manage basic rules using Terraform.

Solution - 
```sh
resource "aws_security_group" "my_sg" {
  name        = "datacenter-sg"
  description = "Security group for Nautilus App Servers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```
---
#### 3. Create a New VPC Using Terraform
Provision a new Virtual Private Cloud (VPC) with default CIDR configuration.

Solution -
```sh
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "nautilus-vpc"
  }
}
```
---
#### 4. Provision a VPC with a Custom CIDR Block
Launch a VPC with a user-defined CIDR block using Terraform.

Solution - 
```sh
resource "aws_vpc" "custom_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "custom-vpc"
  }
}
```
---
#### 5. Launch a VPC with IPv6 Support
Create a VPC with both IPv4 and IPv6 support using Terraform.

Solution - 
```sh
resource "aws_vpc" "dualstack_vpc" {
  cidr_block           = "10.10.0.0/16"
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "dualstack-vpc"
  }
}
```
---
#### 6. Allocate an Elastic IP Address
Create a static Elastic IP address for public-facing services using Terraform.

Solution - 
```sh
resource "aws_eip" "nautilus_eip" {
  vpc = true

  tags = {
    Name = "nautilus-eip"
  }
}
```
---
#### 7. Launch an EC2 Instance
Provision an EC2 instance with a specific AMI and instance type using Terraform.

Solution -
```sh
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example_key.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.nautilus_sg.id]

  tags = {
    Name = "nautilus-ec2"
  }
}
```
---
#### 8. Create an AMI from EC2 Instance
Capture an Amazon Machine Image (AMI) from a running EC2 instance.

Solution - 
```sh
resource "aws_ami_from_instance" "xfusion_ec2_ami" {
  name               = "xfusion-ec2-ami"
  source_instance_id = aws_instance.web.id
  depends_on         = [aws_instance.web]

  tags = {
    Name = "xfusion-ec2-ami"
  }
}
```
---
#### 9. Create an EBS Volume
Provision an EBS volume with a specific size and volume type.

Solution - 
```sh
resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 2
  type              = "gp3"

  tags = {
    Name = "datacenter-volume"
  }
}
```
---
#### 10. Create a Snapshot from an EBS Volume
Take a snapshot of an existing EBS volume to enable future backups or restores.

Solution - 
```sh
resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name = "devops-vol"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id   = aws_ebs_volume.k8s_volume.id
  description = "Devops Snapshot"
  depends_on  = [aws_ebs_volume.k8s_volume]

  tags = {
    Name = "devops-vol-ss"
  }
}
```