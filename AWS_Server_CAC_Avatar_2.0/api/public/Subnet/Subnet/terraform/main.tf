module "subnet" {
  source                   = "./modules/terraform-aws-vpcsubnet"
  vpc_id                   = var.vpc_id
  
  subnet_cidr              = var.subnet_cidr
  availability_zone_subnet = var.availability_zone_subnet
  Nametag                  = var.Nametag
  
}