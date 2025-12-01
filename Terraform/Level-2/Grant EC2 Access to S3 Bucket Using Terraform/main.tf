resource "aws_s3_bucket" "bucket" {
  bucket = var.KKE_BUCKET_NAME

  tags = {
    Name = var.KKE_BUCKET_NAME
  }
}

resource "aws_iam_role" "role" {
  name                = var.KKE_ROLE_NAME

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {Service = "ec2.amazonaws.com"}
      },
    ]
  })
}

resource "aws_iam_policy" "policy" {
  name   = var.KKE_POLICY_NAME

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = ["s3:PutObject"],
        Resource  = "arn:aws:s3:::${var.KKE_BUCKET_NAME}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "iam-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "example" {
  name = "nautilus-instance-profile"
  role = aws_iam_role.role.name
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.example.name

  tags = {
    Name = "datacenter-ec2"
  }
}