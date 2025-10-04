output "kke_instance_names" {
  value       = [for instance in aws_instance.example : instance.tags["Name"]]
  description = "Names of the created EC2 instances"
}
