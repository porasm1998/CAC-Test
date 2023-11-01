resource "aws_lb" "network_lb" {
  name               = var.lb
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  subnets   = var.subnet_id
  enable_deletion_protection = var.enable_deletion_protection
  tags = {
    Environment = var.environment
  }
}