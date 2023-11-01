output "vpc_peer_id" {
  value       = aws_vpc_peering_connection.vpc_peer.id
  description = "VPC peering ID"
}