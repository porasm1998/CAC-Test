output "VPC_ID1" {
  value       = var.VPC_ID1
  description = "VPC id1"
}
output "VPC_ID2" {
  value       = var.VPC_ID2
  description = "VPC id2"
}

output "peer_vpc_route_table" {
  value       = var.peer_vpc_route_table
  description = "VPC 1 Main Route Table"
}

output "vpc_route_table" {
  value       = var.vpc_route_table
  description = "VPC 2 Main Route Table"
}


output "vpc_peer_id" {
  value       = module.vpc_peer_connect.vpc_peer_id
  description = "VPC peering ID"
}