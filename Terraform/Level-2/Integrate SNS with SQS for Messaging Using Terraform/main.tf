resource "aws_sns_topic" "nautilus_sns" {
  name = "nautilus-sns-topic"
}

resource "aws_sqs_queue" "nautilus_sqs" {
  name = "nautilus-sqs-queue"
}

resource "aws_sqs_queue_policy" "nautilus_sqs_policy" {
  queue_url = aws_sqs_queue.nautilus_sqs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "sqs:SendMessage"
        Resource = aws_sqs_queue.nautilus_sqs.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.nautilus_sns.arn
          }
        }
      }
    ]
  })
}

resource "aws_sns_topic_subscription" "nautilus_subscription" {
  topic_arn = aws_sns_topic.nautilus_sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.nautilus_sqs.arn
}
