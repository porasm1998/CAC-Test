// Display resource ids, name and arn


output "sns_stack_name" {
  value       = module.sns.sns_stack_name
  description = "aws sns stack name"
}

