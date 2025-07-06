# AWS Level 2 Tasks - Nautilus DevOps Project

This README documents the AWS Level 2 tasks completed as part of the Nautilus DevOps migration project. Each task includes step-by-step instructions for execution via the AWS Management Console unless specified otherwise.

---

## Task List with Steps

### 1: Launch EC2 and Attach Elastic IP
```sh
Go to EC2 → Launch Instance → AMI: Ubuntu → t2.micro → Name: xfusion-ec2.
Create new Elastic IP: Name xfusion-eip.
Associate the EIP with the EC2 instance.
```
---
### 2: Expand EC2 Volume from 8 GiB to 12 GiB
1. Go to **EC2 → Instances → nautilus-ec2**.
2. Note the **Volume ID** under the "Storage" tab.
3. Go to **EC2 → Volumes → Select Volume ID**.
4. Choose **Modify Volume**, change size to **12 GiB**, and click **Modify**.
5. SSH into the instance using:
   ```bash
   ssh -i /root/nautilus-keypair.pem ubuntu@<public-ip>
   ```
Run:
```bash
sudo growpart /dev/xvda 1
sudo resize2fs /dev/xvda1
```
---
### 3: Create AMI and Launch Instance
Go to EC2 → Instances → nautilus-ec2 → Actions → Create Image.
Name the AMI as nautilus-ec2-ami.

After creation, go to AMIs, select the AMI and click Launch Instance.
Name the new instance nautilus-ec2-new and configure rest as needed.

![Screenshots](screenshots/3.png)
![Screenshots](screenshots/3-1.png)
---
### 4: Setup Password-less SSH Access to EC2
On aws-client host:

```bash
ssh-keygen -t rsa -f ~/.ssh/nautilus-key
```
Copy the public key:

```bash
cat ~/.ssh/nautilus-key.pub
```
SSH into the EC2 instance using original key.

Append the key to ~/.ssh/authorized_keys on the EC2:

```bash
echo "<copied-public-key>" >> ~/.ssh/authorized_keys
```
You can now SSH using the new key:

```bash
ssh -i ~/.ssh/nautilus-key ubuntu@<instance-ip>
```
![Screenshots](screenshots/4.png)
![Screenshots](screenshots/4-1.png)
---
### 5: Setup ALB and Route Traffic
Go to EC2 → Load Balancers → Create Application Load Balancer.

Name: xfusion-alb
Scheme: internet-facing, Listeners: HTTP (80)
VPC: default, Subnets: Select 2 AZs

Create a new Security Group:
Name: xfusion-sg
Inbound rule: Port 80, Source: 0.0.0.0/0

Create a Target Group named xfusion-tg:
Type: Instance, Protocol: HTTP, Port: 80
Register EC2 instance (xfusion-ec2) to target group.

Ensure EC2’s security group allows inbound HTTP from ALB's security group.

Routing Flow:
```vbnet
Client → xfusion-sg (ALB SG) → ALB → Target Group → EC2 SG → Nginx on port 80
```

---
### 6: Create CloudWatch Alarm on EC2
Go to CloudWatch → Alarms → Create Alarm.
Select EC2 Metrics → CPU Utilization for xfusion-ec2.
Set threshold to >= 90% for 1 period of 5 minutes.
Notification: Select SNS topic xfusion-sns-topic.
Name: xfusion-alarm.
---
### 7: Launch EC2 with User Data (Install Nginx)
Go to EC2 → Launch Instance.

Name: xfusion-ec2, AMI: Ubuntu, Type: t2.micro.

Under Advanced Details → User data, paste:

```bash
#!/bin/bash
apt update
apt install nginx -y
systemctl enable nginx
systemctl start nginx
Create or select SG to allow port 80 from 0.0.0.0/0.
```
---
### 8: Sync Data Between Two Buckets (CLI)
```bash
aws s3 mb s3://xfusion-sync-27184
aws s3 sync s3://xfusion-s3-30087 s3://xfusion-sync-27184
```
---
### 9: Create Private RDS with Storage Autoscaling
Go to RDS → Create Database.
Template: Dev/Test or Sandbox.
Engine: MySQL v8.0.x
DB Name: nautilus-rds, Type: db.t3.micro.
Enable Storage Autoscaling, max: 50 GiB.
Uncheck public access.

Launch and wait until status is available.

### 10: Make Existing RDS Public
Go to RDS → Modify datacenter-rds.
Enable Public Access.
In security group, allow inbound rule on port 3306 from 0.0.0.0/0.
Save and apply immediately.