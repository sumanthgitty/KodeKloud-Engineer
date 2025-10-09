output "KKE_ami_id" {
  value = aws_ami_from_instance.ami.id
}

output "KKE_new_instance_id" {
  value = aws_instance.ec2_new.id
}