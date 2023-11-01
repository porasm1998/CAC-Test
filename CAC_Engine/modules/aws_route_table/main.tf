resource "aws_route_table" "aws_rt" {
  vpc_id = var.vpc_id
  //route  = []
  route {
    cidr_block = var.cidr_block
    gateway_id = var.internet_gateway_id
  }

  /* route {
    ipv6_cidr_block        = var.ipv6_cidr_block
    nat_gateway_id = var.nat_gateway_id 
  } */

  tags = var.tags

}