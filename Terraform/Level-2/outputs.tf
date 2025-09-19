output "kke_vpc_name" {
  value = aws_vpc.vpc.tags["Name"]
}

output "kke_subnet_name" {
  value = aws_subnet.subnet.tags["Name"]
}