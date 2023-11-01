// This module will Application Load Balancer
module "aws_target_group" {
  source              = "./modules/terraform-aws-lb_target_group"
  n_target_group_name = var.n_target_group_name
  n_target_type       = var.n_target_type
  n_port              = var.n_port
  n_protocol          = var.n_protocol
  n_vpc_id            = var.n_vpc_id


}

