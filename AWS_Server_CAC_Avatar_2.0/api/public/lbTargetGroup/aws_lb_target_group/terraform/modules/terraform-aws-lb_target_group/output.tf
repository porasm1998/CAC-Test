// Display resource ids, name and arn

output "lb_target_group_name" {
  description = "The ARN suffix of the LB"
  value       = aws_lb_target_group.nlb_target_group.name
}
