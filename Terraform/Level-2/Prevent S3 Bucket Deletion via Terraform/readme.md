#### Task - Prevent S3 Bucket Deletion via Terraform
---
To ensure secure and accidental-deletion-proof storage, the DevOps team must configure an S3 bucket using Terraform with strict lifecycle protections. The goal is to create a bucket that is dynamically named and protected from being destroyed by mistake. Please complete the following tasks:
- Create an S3 bucket named `devops-s3-258`.
- Apply the prevent_destroy lifecycle rule to protect the bucket.
- Use the variables.tf file with the following:
`KKE_BUCKET_NAME`: name of the bucket.
- Use the terraform.tfvars file to input the name of the bucket.
- Use the outputs.tffile with the following:
`s3_bucket_name`: name of the created bucket.

#### Soution - 
---
Files in This Task:
- [main.tf](./main.tf)
- [variables.tf](./variables.tf)
- [outputs.tf](./outputs.tf)
- [terraform.tfvars](./terraform.tfvars)

Steps to Execute:
```sh
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
This creates:
- New s3 bucket: `devops-s3-258` (defined by KKE_BUCKET variable) with prevent destroy policy
