output "aws_instance_id" {
  description = "ec2 instance id"
  value       = module.ec2_instance.aws_instance_id
}

output "aws_instance_arn" {
  description = "ec2 instance arn"
  value       = module.ec2_instance.aws_instance_arn
}

