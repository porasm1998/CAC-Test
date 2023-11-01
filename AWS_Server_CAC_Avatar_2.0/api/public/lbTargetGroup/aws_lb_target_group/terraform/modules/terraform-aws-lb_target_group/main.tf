// Creates the target-group
resource "aws_lb_target_group" "nlb_target_group" {   
  name        = var.n_target_group_name
  target_type = var.n_target_type
  port        = var.n_port
  protocol    = var.n_protocol
  vpc_id      = var.n_vpc_id
   health_check {
    protocol  = var.n_protocol
    port      = var.n_health_check_port

  # ALBs required to use same healthy and unhealthy thresholds
  healthy_threshold   = var.n_health_check_healthy_threshold
  unhealthy_threshold = var.n_health_check_unhealthy_threshold

  # Interval between health checks required to be 10 or 30
  interval = var.n_health_check_interval

  }
}