// Display resources name, id, arn 
output "transit_gateway_id" {
  description = "transit gateway id"
  value       = aws_ec2_transit_gateway.my-tgw.id
}

output "transit_gateway_amazon_side_asn" {
  description = "transit gateway name"
  value       = aws_ec2_transit_gateway.my-tgw.amazon_side_asn
}

output "transit_gateway_arn" {
  description = "transit gateway arn"
  value       = aws_ec2_transit_gateway.my-tgw.arn
}

output "ec2_transit_gateway_owner_id" {
  description = "Identifier of the AWS account that owns the EC2 Transit Gateway"
  value       = aws_ec2_transit_gateway.my-tgw.owner_id
}

output "ec2_transit_gateway_association_default_route_table_id" {
  description = "Identifier of the default association route table"
  value       = aws_ec2_transit_gateway.my-tgw.association_default_route_table_id
}

output "aws_ec2_transit_gateway_vpc_attachment1_id" {
  description = "transit gateway vpc attachment1 id"
  value       = aws_ec2_transit_gateway_vpc_attachment.attachment1.id
}

output "aws_ec2_transit_gateway_vpc_attachment2_id" {
  description = "transit gateway vpc attachment2 id"
  value       = aws_ec2_transit_gateway_vpc_attachment.attachment2.id
}

output "aws_ec2_transit_gateway_vpc_attachment1_subnet_ids" {
  description = "transit gateway vpc attachment1 subnet_ids"
  value       = aws_ec2_transit_gateway_vpc_attachment.attachment1.subnet_ids
}

output "aws_ec2_transit_gateway_vpc_attachment2_subnet_ids" {
  description = "transit gateway vpc attachment2 subnet_ids"
  value       = aws_ec2_transit_gateway_vpc_attachment.attachment2.subnet_ids
}

output "aws_ec2_transit_gateway_vpc_attachment1_vpc_id" {
  description = "transit gateway vpc attachment1 vpc id"
  value       = aws_ec2_transit_gateway_vpc_attachment.attachment1.vpc_id
}

output "aws_ec2_transit_gateway_vpc_attachment2_vpc_id" {
  description = "transit gateway vpc attachment2 vpc id"
  value       = aws_ec2_transit_gateway_vpc_attachment.attachment2.vpc_id
}

output "aws_route1" {
  description = "route1 id"
  value       = aws_route.route1.id
}

output "aws_route2" {
  description = "route2 id"
  value       = aws_route.route2.id
}

output "aws_route1_destination_cidr_block" {
  description = "route1 destination_cidr_block"
  value       = aws_route.route1.destination_cidr_block
}

output "aws_route2_destination_cidr_block" {
  description = "route2 destination_cidr_block"
  value       = aws_route.route2.destination_cidr_block
}

