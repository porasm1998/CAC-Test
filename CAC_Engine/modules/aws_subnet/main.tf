
resource "aws_subnet" "subnet" {
  vpc_id                   = var.vpc_id
  cidr_block               = var.subnet_cidr
  availability_zone        = var.availability_zone
  map_public_ip_on_launch  = var.map_public_ip_on_launch
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  enable_dns64              = var.enable_dns64
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch
  ipv6_native               = var.ipv6_native
  tags = var.tags
}