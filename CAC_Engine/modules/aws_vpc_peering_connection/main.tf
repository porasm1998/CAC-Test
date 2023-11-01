resource "aws_vpc_peering_connection" "Vpc_peering" {
  peer_owner_id = var.peer_owner_id
  vpc_id      = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  auto_accept = var.auto_accept
  peer_region = var.aws_region
  /* accepter {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution_accepter
  }
  requester {
    allow_remote_vpc_dns_resolution = var.allow_remote_vpc_dns_resolution_requester
  }*/
} 


