module "aws_nat_gateway" {
  source = "./public_nat_gateway"
  subnet_id = var.subnet_id
  allocation_id = var.allocation_id
  name = var.name

}