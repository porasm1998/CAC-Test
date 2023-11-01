module "aws_internet_gateway_1" {
  source = "../../../InternetGateway/InternetGateway/terraform/internet_gateway"
  vpc_id = module.vpc_1.vpc_id
  name = var.name
}
# Internet VPC
module "vpc_1" {
  source                     = "../../../VPC/vpc/terraform/modules/terraform-aws-vpc"
  cidr_block                 = var.cidr_block
  Nametag                    = var.Nametag
}
