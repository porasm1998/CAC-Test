

module "vpc" {
  source                     = "./modules/terraform-aws-vpc"
  cidr_block                 = var.cidr_block
  Nametag                    = var.Nametag
}

