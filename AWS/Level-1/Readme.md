# AWS Migration Tasks - Nautilus DevOps Project 

This repository documents the 40 AWS tasks completed during the staged migration of Nautilus infrastructure to the AWS cloud. All steps are included using AWS Console or CLI.

---

## Task List with Steps

### 1. Create Key Pair `datacenter-kp`
```sh
- Go to EC2 → Key Pairs → Create key pair
- Name: `datacenter-kp`
- Type: RSA
- Download the `.pem` file
```
---

### 2. Create Security Group `nautilus-sg`
```sh
- EC2 → Security Groups → Create security group
- Name: `nautilus-sg`
- Description: `Security group for Nautilus App Servers`
- Add inbound rules:
  - Type: HTTP, Port: 80, Source: 0.0.0.0/0
  - Type: SSH, Port: 22, Source: 0.0.0.0/0
```
---

### 3. Create Volume `xfusion-volume`
```sh
- EC2 → Volumes → Create volume
- Name: `xfusion-volume`
- Type: `gp3`
- Size: `2 GiB`
```
---

### 4. Create Subnet `nautilus-subnet`
```sh
- VPC → Subnets → Create Subnet
- VPC: Default
- Name: `nautilus-subnet`
- CIDR Block: `10.0.0.0/20`
```
---

### 5. Allocate Elastic IP `devops-eip`
```sh
- EC2 → Elastic IPs → Allocate Elastic IP
- Name tag: `devops-eip`
```
---

### 6. Launch EC2 Instance `nautilus-ec2`
```sh
- EC2 → Launch instance
- Name: `nautilus-ec2`
- AMI: Amazon Linux
- Instance type: `t2.micro`
- Key pair: `nautilus-kp`
- Security group: default
```
---

### 7. Change Instance Type to `t2.nano` for `devops-ec2`
```bash
aws ec2 stop-instances --instance-ids <instance-id>
aws ec2 modify-instance-attribute --instance-id <instance-id> --instance-type "{\"Value\": \"t2.nano\"}"
aws ec2 start-instances --instance-ids <instance-id>
```

### 8. Enable Stop Protection for devops-ec2
```sh
Select devops-ec2
Actions → Instance Settings → Change Stop Protection → Enable
```
---

### 9. Enable Termination Protection for devops-ec2
```sh
Actions → Instance Settings → Change Termination Protection → Enable
```
---

### 10. Attach Elastic IP xfusion-ec2-eip to xfusion-ec2
```sh
Elastic IPs → Select IP → Actions → Associate IP
Choose instance: xfusion-ec2
```
---

### 11. Attach ENI nautilus-eni to nautilus-ec2
```sh
Network Interfaces → Select → Attach → Choose nautilus-ec2
```
---

### 12. Attach Volume nautilus-volume to nautilus-ec2
```sh
Volumes → Select → Actions → Attach volume
Instance: nautilus-ec2
Device: /dev/sdb
```
---

### 13. Create AMI from xfusion-ec2
```sh
Instances → Select → Actions → Create Image
Name: xfusion-ec2-ami
```
---

### 14. Delete EC2 Instance datacenter-ec2
```sh
Instances → Select → Terminate → Confirm
```
---

### 15. Create Snapshot of datacenter-vol
```sh
Volumes → Select → Actions → Create snapshot
Name: datacenter-vol-ss
Description: datacenter Snapshot
```
---

### 16. Create IAM User iamuser_james
```sh
IAM → Users → Add user
Username: iamuser_james
Select programmatic access
```
---

### 17. Create IAM Group iamgroup_javed
```sh
IAM → Groups → Create group
Name: iamgroup_javed
```
---

### 18. Create IAM Policy iampolicy_javed
```sh
IAM → Policies → Create policy → JSON
```
```json
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Action": ["ec2:DescribeInstances", "ec2:DescribeImages", "ec2:DescribeSnapshots"],
    "Resource": "*"
  }]
}
```
---

### 19. Attach Policy iampolicy_jim to User iamuser_jim
```sh
IAM → Users → Select iamuser_jim → Permissions → Attach policies → Choose iampolicy_jim
```
---

### 20. Create IAM Role iamrole_anita
```sh
IAM → Roles → Create role
Trusted entity: EC2
Attach policy: iampolicy_anita
Name: iamrole_anita
```
---

### 21. Delete IAM Group iamgroup_javed
```sh
IAM → Groups → Select iamgroup_javed → Delete
```
---

### 22. Delete IAM Role iamrole_mark
```sh
IAM → Roles → Select iamrole_mark → Delete
```

### 23. Create Private S3 Bucket nautilus-s3-19730
```sh
S3 → Create bucket
Name: nautilus-s3-19730
Enable: Block all public access
```
---

### 24. Create Public S3 Bucket
```sh
S3 → Create bucket
Uncheck “Block all public access”
```
---

### 25. Enable Versioning on Bucket datacenter-s3-11438
```sh
S3 → Select bucket → Properties → Versioning → Enable
```
---

### 26. Upload File to S3 Bucket devops-cp-5911 (CLI)
```bash
aws s3 cp /tmp/devops.txt s3://devops-cp-5911/
```
---

### 27. Copy & Delete S3 Bucket datacenter-bck-7245
```bash
aws s3 cp s3://datacenter-bck-7245 /opt --recursive
aws s3 rb s3://datacenter-bck-7245 --force
```
---

### 28. Create RDS datacenter-rds
```sh
RDS → Create database → MySQL
Engine: MySQL v8.0.36
Instance type: db.t3.micro
Username: datacenter_admin
Storage: 5 GiB (gp2)
Enable: Public Access
```
---

### 29. Create Snapshot of RDS datacenter-rds
```sh
RDS → Snapshots → Create snapshot
Name: datacenter-rds-snapshot
```
---

### 30. Enable Deletion Protection on RDS datacenter-rds
```sh
RDS → Modify instance
Enable: Deletion protection → Apply immediately
```
---

### 31. Upgrade RDS devops-rds to MySQL v8.0.36
```sh
RDS → Modify instance
Engine version: 8.0.36 → Apply immediately
```
---

### 32. Delete RDS nautilus-rds
```sh
RDS → Select instance → Delete
Uncheck “Final snapshot” if asked
```
---

### 33. Create VPC xfusion-vpc
```sh
VPC → Create VPC
Name: xfusion-vpc
CIDR: 10.0.0.0/16
```
---

### 34. Define CIDR for nautilus-vpc
```sh
VPC → Create VPC
Name: nautilus-vpc
CIDR: 192.168.0.0/24
```
---

### 35. Implement VPC IPv6
```sh
VPC → Create VPC → Enable “Amazon-provided IPv6”
```
---

### 36. Delete VPC devops-vpc

Delete all subnets, route tables, IGWs first
Then delete VPC

---

### 37. Create Private S3 Bucket via CLI
```bash
aws s3api create-bucket --bucket xfusion-s3-16753 --region us-east-1
aws s3api put-public-access-block \
  --bucket xfusion-s3-16753 \
  --public-access-block-configuration 'BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true'
```
---

### 38. Launch EC2 Instance via CLI
```bash
aws ec2 run-instances \
  --image-id ami-0cd59ecaf368e5ccf \
  --instance-type t2.micro \
  --key-name xfusion-kp \
  --security-group-ids <sg-id> \
  --subnet-id <subnet-id> \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=xfusion-ec2}]' \
  --region us-east-1
```
---

### 39. Modify EC2 Instance Type to t2.nano via CLI
```bash
aws ec2 stop-instances --instance-ids <id>
aws ec2 modify-instance-attribute --instance-id <id> --instance-type "{\"Value\": \"t2.nano\"}"
aws ec2 start-instances --instance-ids <id>
```
---

### 40. Delete EC2 Instance via CLI
```bash
aws ec2 terminate-instances --instance-ids <id>
```