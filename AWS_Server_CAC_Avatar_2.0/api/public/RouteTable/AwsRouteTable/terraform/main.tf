module "rt" {
  source     = "./module"
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  internet_gateway_id = var.internet_gateway_id
}