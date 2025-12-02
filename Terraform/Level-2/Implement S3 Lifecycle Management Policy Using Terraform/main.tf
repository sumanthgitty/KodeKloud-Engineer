resource "aws_s3_bucket" "bucket" {
  bucket = "devops-lifecycle-20139"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_rule" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "devops-lifecycle-rule"
    status = "Enabled"

    filter {
      prefix = ""
    }

    expiration {
      days = 365
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }
}