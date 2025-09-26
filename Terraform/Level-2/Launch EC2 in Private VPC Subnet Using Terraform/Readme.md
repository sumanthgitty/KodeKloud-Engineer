#### Task - Launch EC2 in Private VPC Subnet Using Terraform
---
Create an EC2 instance named datacenter-priv-ec2 inside a subnet.
- Instance type must be t2.micro.
- Ensure the security group of the EC2 instance allows access only from within the VPC's CIDR block.
- Use variables:
KKE_VPC_CIDR for the VPC CIDR block.
KKE_SUBNET_CIDR for the subnet CIDR block.
- Output the VPC name, subnet name, and EC2 instance name.

#### Solution - 
---

- [main.tf](./main.tf)
- [variables.tf](./variables.tf)
- [outputs.tf](./outputs.tf)

**Steps to Execute**

Initialize Terraform
```sh
terraform init
```
Validate the configuration
```sh
terraform validate
```
Preview the resources to be created
```sh
terraform plan
```
Apply the configuration
```sh
terraform apply -auto-approve
```

Check **Outputs**
After apply, Terraform will display:

- KKE_vpc_name -> Name of the created VPC
- KKE_subnet_name -> Name of the created Subnet
- KKE_ec2_private -> Name of the created Ec2. 