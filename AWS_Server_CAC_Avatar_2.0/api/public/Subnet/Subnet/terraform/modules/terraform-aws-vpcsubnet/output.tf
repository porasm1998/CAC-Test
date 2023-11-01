// Dispaly resources arn and ids


output "subnet_arn" {
  value       = aws_subnet.subnet.*.arn
  description = "vpc ARN"
}

output "subnet_id" {
  value       = aws_subnet.subnet.*.id
  description = "vpc ARN"
}