// Display resource ids, name and arn
output "autoscaling_group_id" {
  description = "autoscaling group details"
  value       = aws_autoscaling_group.ecs_asg.id
}

output "autoscaling_group_arn" {
  description = "autoscaling group details"
  value       = aws_autoscaling_group.ecs_asg.arn
}

output "aws_ecs_capacity_provider_id" {
  description = "ec2 instance host id"
  value       = aws_ecs_capacity_provider.cap_prov
}

output "aws_ecs_cluster_details" {
  description = "ec2 instance private ip"
  value       = aws_ecs_cluster.my_cluster
}

output "aws_ecs_task_definition_details" {
  description = "ec2 instance public ip"
  value       = aws_ecs_task_definition.task1
}

output "aws_ecs_service_details" {
  value       = aws_ecs_service.ecs_container
  description = "AWS cloudwatch metric alarm id"
}
/* locals{

    common_tags=var.containers_tag
}

output "tags"{
    value=local.common_tags
} */
