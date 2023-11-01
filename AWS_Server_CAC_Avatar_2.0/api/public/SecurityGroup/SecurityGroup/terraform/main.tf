module "security_group" {
  source            = "./module"
  sg_name           = var.sg_name
  vpc_id            = var.vpc_id
  ingress_from_port = var.ingress_from_port
  ingress_to_port   = var.ingress_to_port
  protocol          = var.protocol
  cidr_block        = var.cidr_block
  egress_from_port  = var.egress_from_port
  egress_to_port    = var.egress_to_port
  egress_protocol   = var.egress_protocol
  tag_name          = var.tag_name
}