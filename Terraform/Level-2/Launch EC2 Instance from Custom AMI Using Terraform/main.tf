# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-ce2f42e5089ce0d3c"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}

resource "aws_ami_from_instance" "ami" {
  name               = "xfusion-ec2-ami"
  source_instance_id = aws_instance.ec2.id
}

resource "aws_instance" "ec2_new" {
  ami           = aws_ami_from_instance.ami.id
  instance_type = "t2.micro"
  depends_on    = [aws_ami_from_instance.ami]

  tags = {
    Name = "xfusion-ec2-new"
  }
}