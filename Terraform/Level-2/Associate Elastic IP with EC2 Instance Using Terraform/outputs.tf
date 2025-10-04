output "KKE_instance_name" {
  value = aws_instance.instance.tags["Name"]
}

output "KKE_eip" {
  value = aws_eip.nautilus.public_ip
}