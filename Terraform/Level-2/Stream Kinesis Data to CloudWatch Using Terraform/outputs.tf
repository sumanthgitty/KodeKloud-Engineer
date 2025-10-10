output "kke_kinesis_stream_name" {
  value = aws_kinesis_stream.test_stream.name
}

output "kke_kinesis_alarm_name" {
  value = aws_cloudwatch_metric_alarm.foobar.alarm_name
}
