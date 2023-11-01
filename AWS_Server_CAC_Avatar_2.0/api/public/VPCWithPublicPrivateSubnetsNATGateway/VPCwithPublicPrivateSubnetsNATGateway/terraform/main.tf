/*
This module will create VPC, Public subnet, Private subnet, Internet gateway, Ealstic IPS and NAT Gateway
*/

// vpc module

module "vpc" {
  source                     = "./modules/terraform-aws-vpc"
  cidr_block                 = var.cidr_block
  public_subnet_cidr_block   = var.public_subnet_cidr_block
  private_subnet_cidr_block  = var.private_subnet_cidr_block
  availability_zone          = var.availability_zone
  eip_count                  = var.eip_count
}

