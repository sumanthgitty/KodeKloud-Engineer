#### Task - Stream Kinesis Data to CloudWatch Using Terraform
---
The monitoring team wants to improve observability into the streaming infrastructure. Your task is to implement a solution using Amazon Kinesis and CloudWatch. The team wants to ensure that if write throughput exceeds provisioned limits, an alert is triggered immediately.

As a member of the Nautilus DevOps Team, perform the following tasks using Terraform:
- Create a Kinesis Data Stream named datacenter-kinesis-stream with 1 shard.
- Enable shard-level metrics to monitor ingestion and throughput errors.
- Create a CloudWatch Alarm named datacenter-kinesis-alarm to monitor the WriteProvisionedThroughputExceeded metric and trigger when it exceeds 1.
- Configure alerting to detect write throughput issues.
- In outputs.tf, output:
`kke_kinesis_stream_name` - Kinesis stream name, 
`kke_kinesis_alarm_name` - CloudWatch alarm name

#### Solution - 
---
Add the following:
- [main.tf](./main.tf)
- [outputs.tf](./outputs.tf)

Commands to run:
```sh
terrafrom init
terraform validate
terraform plan
terraform apply
```

Outputs:
- kke_kinesis_stream_name -> datacenter-kinesis-stream
- kke_kinesis_alarm_name -> datacenter-kinesis-alarm
