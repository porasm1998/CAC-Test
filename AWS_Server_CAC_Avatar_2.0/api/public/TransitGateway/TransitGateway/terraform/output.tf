// Display resources name, id, arn 
output "transit_gateway_id" {
  description = "transit gateway id"
  value       = module.tgw.transit_gateway_id
}

output "transit_gateway_amazon_side_asn" {
  description = "transit gateway name"
  value       = module.tgw.transit_gateway_amazon_side_asn
}

output "transit_gateway_arn" {
  description = "transit gateway arn"
  value       = module.tgw.transit_gateway_arn
}

output "ec2_transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
  value       = module.tgw.ec2_transit_gateway_owner_id
}

output "ec2_transit_gateway_association_default_route_table_id" {
  description = "Identifier of the default association route table"
  value       = module.tgw.ec2_transit_gateway_association_default_route_table_id
}

output "aws_ec2_transit_gateway_vpc_attachment1_id" {
  description = "transit gateway vpc attachment1 id"
  value       = module.tgw.aws_ec2_transit_gateway_vpc_attachment1_id
}

output "aws_ec2_transit_gateway_vpc_attachment2_id" {
  description = "transit gateway vpc attachment2 id"
  value       = module.tgw.aws_ec2_transit_gateway_vpc_attachment2_id
}

output "aws_ec2_transit_gateway_vpc_attachment1_subnet_ids" {
  description = "transit gateway vpc attachment1 subnet_ids"
  value       = module.tgw.aws_ec2_transit_gateway_vpc_attachment1_subnet_ids
}

output "aws_ec2_transit_gateway_vpc_attachment2_subnet_ids" {
  description = "transit gateway vpc attachment2 subnet_ids"
  value       = module.tgw.aws_ec2_transit_gateway_vpc_attachment2_subnet_ids
}

output "aws_ec2_transit_gateway_vpc_attachment1_vpc_id" {
  description = "transit gateway vpc attachment1 vpc id"
  value       = module.tgw.aws_ec2_transit_gateway_vpc_attachment1_vpc_id
}

output "aws_ec2_transit_gateway_vpc_attachment2_vpc_id" {
  description = "transit gateway vpc attachment2 vpc id"
  value       = module.tgw.aws_ec2_transit_gateway_vpc_attachment2_vpc_id
}

output "aws_route1" {
  description = "route1 id"
  value       = module.tgw.aws_route1
}

output "aws_route2" {
  description = "route2 id"
  value       = module.tgw.aws_route2
}

output "aws_route1_destination_cidr_block" {
  description = "route1 destination_cidr_block"
  value       = module.tgw.aws_route1_destination_cidr_block
}

output "aws_route2_destination_cidr_block" {
  description = "route2 destination_cidr_block"
  value       = module.tgw.aws_route2_destination_cidr_block
}