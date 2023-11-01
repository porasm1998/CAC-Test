module "rta_web2" {
  source         = "./modules/terraform_aws_route_table_association2"
  rt_subnet_id      = var.rt_subnet_id
  rt_route_table_id = var.rt_route_table_id
  // tags       = var.tags
}