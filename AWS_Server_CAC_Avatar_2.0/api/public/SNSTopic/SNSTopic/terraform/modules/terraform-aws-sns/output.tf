// Dispaly resources names and ids

// SNS 

output "sns_stack_name" {
  value       = aws_cloudformation_stack.tf_sns_topic.name
  description = "aws sns stack name"
}

