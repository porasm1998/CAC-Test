/*
This module will creating the VPC peering connection
*/

module "vpc_peer_connect" {
  source                     = "./modules/terraform-aws-vpc-peer"
  peer_vpc_id                 = var.VPC_ID1
  vpc_id                      = var.VPC_ID2
  peering_connection_name     = var.peering_connection_name
  peer_vpc_route_table        = var.peer_vpc_route_table
  vpc_route_table             = var.vpc_route_table
  cidr_vpc_peer               = var.cidr_vpc1
  cidr_vpc                    = var.cidr_vpc2 
  
}
