// Dispaly resources names and ids

// VPC and its related componenets

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC id"
}

output "internet_gateway_id" {
  value       = module.vpc.internet_gateway_id
  description = "internet gateway id"
}

output "nat_eip" {
  value       =  module.vpc.nat_eip
  description = "Elastic IP"
}

output "nat_gateway_id" {
  value       =  module.vpc.nat_gateway_id
  description = "nat gateway id"
}

output "public_route_table" {
  value       = module.vpc.public_route_table
  description = "public route table id"
}

output "private_route_table" {
  value       = module.vpc.private_route_table
  description = "private route table id"
}

output "public_subnet_id" {
  value       = module.vpc.public_subnet_id
  description = "public subnet id"
}

output "private_subnet_id" {
  value       = module.vpc.private_subnet_id
  description = "public subnet id"
}

output "elastic_ip_list" {
  value       =  module.vpc.elastic_ip_list
  description = "Elastic IP"
}
