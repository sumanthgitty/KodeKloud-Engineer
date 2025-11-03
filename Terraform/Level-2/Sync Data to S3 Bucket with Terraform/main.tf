resource "aws_s3_bucket" "wordpress_bucket" {
  bucket = "nautilus-s3-10057"
}

resource "aws_s3_bucket_acl" "wordpress_bucket_acl" {
  bucket = aws_s3_bucket.wordpress_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket" "new_bucket" {
  bucket = var.KKE_BUCKET
}

resource "aws_s3_bucket_acl" "wordpress_bucket_acl2" {
  bucket = aws_s3_bucket.new_bucket.id
  acl    = "private"
}