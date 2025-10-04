output "KKE_vpc_name" {
  value       = aws_vpc.vpc.tags["Name"]
  description = "VPC name"
}

output "KKE_subnet_name" {
  value       = aws_subnet.subnet.tags["Name"]
  description = "Subnet name"
}

output "KKE_ec2_private" {
  value       = aws_instance.example.tags["Name"]
  description = "EC2 instance name"
}