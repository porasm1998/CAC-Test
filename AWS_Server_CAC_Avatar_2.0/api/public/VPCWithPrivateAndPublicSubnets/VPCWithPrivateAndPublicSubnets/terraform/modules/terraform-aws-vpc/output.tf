// Dispaly resources names and ids

// VPC and its related componenets

output "vpc_id" {
  value       = aws_vpc.default.id
  description = "VPC id"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.gw.id
  description = "internet gateway id"
}

output "public_route_table" {
  value       = aws_route_table.public.id
  description = "public route table id"
}

output "private_route_table" {
  value       = aws_route_table.private.id
  description = "private route table id"
}

output "public_subnet_id" {
  value       = aws_subnet.public[*].id
  description = "public subnet id"
}

output "private_subnet_id" {
  value       = aws_subnet.private[*].id
  description = "public subnet id"
}


