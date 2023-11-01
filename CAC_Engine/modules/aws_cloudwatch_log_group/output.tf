
output "log_group_arn" {
    value = aws_cloudwatch_log_group.main.arn
}

output "log_stream_arn" {
    value = aws_cloudwatch_log_stream.stream.arn
}