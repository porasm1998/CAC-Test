output "aws_internet_gateway" {
  value       = module.aws_internet_gateway_1.aws_internet_gateway
}
output "vpc_id" {
    value = module.vpc_1.vpc_id
}