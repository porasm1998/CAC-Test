module "aws_internet_gateway" {
  source = "./internet_gateway"
  vpc_id = var.vpc_id
  name = var.name
}