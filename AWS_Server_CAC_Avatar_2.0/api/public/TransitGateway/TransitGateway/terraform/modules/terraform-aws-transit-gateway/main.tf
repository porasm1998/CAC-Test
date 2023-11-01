// AWS Transit gatway creation
resource "aws_ec2_transit_gateway" "my-tgw" {
  description                     = var.description
  amazon_side_asn                 = var.amazon_side_asn
  auto_accept_shared_attachments  = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"
  tags = var.tg_tags
}

// AWS Transit gateway attachements
resource "aws_ec2_transit_gateway_vpc_attachment" "attachment1" {
  subnet_ids         = var.vpc1_subnet_ids 
  transit_gateway_id = aws_ec2_transit_gateway.my-tgw.id
  vpc_id             = var.vpc1                              
  tags               = var.tg_attachment1_tags
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attachment2" {
  subnet_ids         = var.vpc2_subnet_ids
  transit_gateway_id = aws_ec2_transit_gateway.my-tgw.id
  vpc_id             = var.vpc2                              
  tags               = var.tg_attachment2_tags
}

// AWS VPC route table updates(Add TGW to VPC route table for return traffic)
resource "aws_route" "route1" {
  route_table_id         = var.vpc1_route_table_id
  destination_cidr_block = var.destination_cidr_block2
  transit_gateway_id     = aws_ec2_transit_gateway.my-tgw.id
}

resource "aws_route" "route2" {
  route_table_id         = var.vpc2_route_table_id
  destination_cidr_block = var.destination_cidr_block1
  transit_gateway_id     = aws_ec2_transit_gateway.my-tgw.id
}