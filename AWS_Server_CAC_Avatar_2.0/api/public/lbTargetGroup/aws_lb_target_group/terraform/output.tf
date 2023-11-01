// Display resource  name


output "lb_target_group_name" {
  description = "The ARN suffix of the LB"
  value       = module.aws_target_group.lb_target_group_name
}
