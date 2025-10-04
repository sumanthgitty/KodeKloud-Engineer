resource "aws_eip_association" "nautilus_assoc" {
  instance_id   = aws_instance.instance.id
  allocation_id = aws_eip.nautilus.id
}

resource "aws_instance" "instance" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  tags = {
    Name = "nautilus-ec2"
  }
}

resource "aws_eip" "nautilus" {
  domain = "vpc"

  tags = {
        Name = "nautilus-eip"
  }
}