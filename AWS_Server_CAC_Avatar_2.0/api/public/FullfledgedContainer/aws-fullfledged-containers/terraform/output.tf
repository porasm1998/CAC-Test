// Display resource ids, name and arn
output "autoscaling_group_id" {
  description = "autoscaling group details"
  value       = module.ecs.autoscaling_group_id
}

output "autoscaling_group_arn" {
  description = "autoscaling group details"
  value       = module.ecs.autoscaling_group_arn
}

output "aws_ecs_capacity_provider_id" {
  description = "ec2 instance host id"
  value       = module.ecs.aws_ecs_capacity_provider_id
}

output "aws_ecs_cluster_details" {
  description = "ec2 instance private ip"
  value       = module.ecs.aws_ecs_cluster_details
}

output "aws_ecs_task_definition_details" {
  description = "ec2 instance public ip"
  value       = module.ecs.aws_ecs_task_definition_details
}

output "aws_ecs_service_details" {
  value       = module.ecs.aws_ecs_service_details
  description = "AWS cloudwatch metric alarm id"
}


