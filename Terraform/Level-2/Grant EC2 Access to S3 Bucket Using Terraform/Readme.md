#### Task - Grant EC2 Access to S3 Bucket Using Terraform
---
Set up an EC2 instance that can securely upload logs to an S3 bucket using IAM roles.

Requirements -
- Create an EC2 instance named datacenter-ec2.
- Create an S3 bucket named datacenter-logs-19241.
- Create an IAM role datacenter-role with a policy datacenter-access-policy that allows s3:PutObject on the bucket.
- Attach the IAM role to the EC2 instance.
- Write all AWS resources in main.tf (no separate TF files except variables and data).
- Create variables.tf with:
`KKE_BUCKET_NAME` 
`KKE_POLICY_NAME`
`KKE_ROLE_NAME`
- Create terraform.tfvars to assign values.
- Create data.tf to fetch the latest Amazon Linux 2 AMI.

#### Solution - 
---
Files in This Task:
- [main.tf](./main.tf)
- [variables.tf](./variables.tf)
- [terraform.tfvars](./terraform.tfvars)
- [data.tf](./data.tf)

Steps to Execute:
```sh
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

This creates:
- S3 bucket: `datacenter-logs-19241` (from `KKE_BUCKET_NAME`)
- IAM role: datacenter-role with policy `datacenter-access-policy` allowing `s3:PutObject`
- EC2 instance: `datacenter-ec2` with the attached role for secure S3 uploads
- EC2 AMI Lookup (via `data.tf`):
Terraform fetches the latest Amazon Linux 2 AMI, which is used to launch the instance.