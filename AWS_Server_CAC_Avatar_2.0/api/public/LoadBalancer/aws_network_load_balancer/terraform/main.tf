module "aws_netlb" {
  source = "./module"
  lb = var.lb
  subnet_id = var.subnet_id
  load_balancer_type = var.load_balancer_type
  environment = var.environment



}