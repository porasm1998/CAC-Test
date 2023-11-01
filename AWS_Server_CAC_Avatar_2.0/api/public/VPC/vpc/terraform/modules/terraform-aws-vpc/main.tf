# Internet VPC
resource "aws_vpc" "default" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
 // enable_classiclink   = var.enable_classiclink
  tags                 = {
    Name = var.Nametag
  }
}