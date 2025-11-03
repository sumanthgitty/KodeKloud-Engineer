output "new_kke_bucket_name" {
  value = aws_s3_bucket.new_bucket.bucket
}

output "new_kke_bucket_acl" {
  value = aws_s3_bucket_acl.wordpress_bucket_acl2.acl
}