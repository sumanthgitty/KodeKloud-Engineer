output "kke_sns_topic_arn" {
  value = aws_sns_topic.nautilus_sns.arn
}

output "kke_sqs_queue_url" {
  value = aws_sqs_queue.nautilus_sqs.id
}