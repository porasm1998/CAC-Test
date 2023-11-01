// Dispaly resources names and ids


output "subnet_arn" {
  value       = module.subnet.subnet_arn
  description = "subnet ARN"
}

output "subnet_id" {
  value       = module.subnet.subnet_id
  description = "subnet id"
}