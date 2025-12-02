#### Task - Implement S3 Lifecycle Management Policy Using Terraform
---
Implement an S3 bucket with lifecycle management in AWS.

Requirements –

- Create an S3 bucket named devops-lifecycle-20139.
- Enable versioning on the bucket.
- Add a lifecycle rule devops-lifecycle-rule that:
- Transitions objects to STANDARD_IA after 30 days.
- Deletes objects after 365 days.
- In outputs.tf, output the bucket name using:
`KKE_bucket_name`

#### Solution - 
---
Files in This Task:
- [main.tf](./main.tf)
- [outputs.tf](./outputs.tf)

Steps to Execute:
```sh
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

This creates:
- S3 bucket: `devops-lifecycle-20139`
- Versioning: Enabled on the bucket
- Lifecycle rule: `devops-lifecycle-rule`
- Transitions objects to `STANDARD_IA` after `30 days`
- Deletes objects after `365 days`
- Output (KKE_bucket_name):
Returns the created bucket name from `outputs.tf`.


