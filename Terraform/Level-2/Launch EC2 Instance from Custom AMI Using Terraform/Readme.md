#### Task - Launch EC2 Instance from Custom AMI Using Terraform
---
The Nautilus DevOps team needs to create an AMI from an existing EC2 instance for backup and scaling purposes. The following steps are required:

- They have an existing EC2 instance named `xfusion-ec2`.
- They need to create an AMI named `xfusion-ec2-ami` from this instance.
- Additionally, they need to launch a new EC2 instance named `xfusion-ec2-new` using this AMI.
- Create an outputs.tf file to output the following values:

`KKE_ami_id` for the AMI ID you created.
`KKE_new_instance_id` for the EC2 instance ID you created.

#### Solution - 
---
- [main.tf](./main.tf)
- [outputs.tf](./outputs.tf)

**Steps to Execute**
```sh
terraform init
terraform validate
terraform plan
terraform apply
```

Check **Outputs**
After apply, Terraform will display:

- `KKE_ami_id` -> AMI Id
- `KKE_new_instance_id` -> Instance Id