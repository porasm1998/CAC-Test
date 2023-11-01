/*
This module will creating the VPC peering connection
*/

resource "aws_vpc_peering_connection" "vpc_peer" {
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id
  auto_accept   = true

  tags = {
    Name = var.peering_connection_name
  }
}


resource "aws_route" "peer_vpc_route" {
  route_table_id            = var.peer_vpc_route_table
  destination_cidr_block    = var.cidr_vpc
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer.id
}

resource "aws_route" "vpc_route" {
  route_table_id            = var.vpc_route_table
  destination_cidr_block    = var.cidr_vpc_peer
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer.id
}
