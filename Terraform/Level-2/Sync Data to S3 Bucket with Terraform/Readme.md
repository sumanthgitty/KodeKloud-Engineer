#### Task - Sync Data to S3 Bucket with Terraform
---
As part of a data migration project, the Nautilus DevOps Team must migrate data from an existing S3 bucket to a new private S3 bucket. Terraform will be used to create the new bucket, and AWS CLI will handle data synchronization to ensure both buckets contain identical data.

Requirements - 
- Create a new private S3 bucket named nautilus-sync-3900.
- Use a variable KKE_BUCKET to store the new bucket name.
- Migrate data from existing bucket nautilus-s3-10057 to the new one.
- Ensure data consistency between both buckets.

#### Solution - 
---
Files in This Task:
- [main.tf](./main.tf)
- [variables.tf](./variables.tf)
- [outputs.tf](./outputs.tf)

Steps to Execute:
```sh
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
This creates:
- Existing bucket: `nautilus-s3-10057` (reference)
- New bucket: `nautilus-sync-3900` (defined by KKE_BUCKET variable)

Data Migration (Manual Step):

After the new bucket is created, use AWS CLI to sync data from the old bucket to the new one:
```sh
aws s3 sync s3://nautilus-s3-10057 s3://nautilus-sync-3900
```
- This ensures all data is copied accurately.
- Run this command periodically (or via cron job) to maintain consistency if the source bucket changes.