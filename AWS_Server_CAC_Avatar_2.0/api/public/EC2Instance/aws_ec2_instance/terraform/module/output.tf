// Display resource ids, name and arn

output "aws_instance_id" {
  description = "ec2 instance id"
  value       = aws_instance.web.id
}

output "aws_instance_arn" {
  description = "ec2 instance arn"
  value       = aws_instance.web.arn
}



