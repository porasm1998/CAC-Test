// Below are variables specific to user account and other componenets 
/*variable "aws_access_key" {}
variable "aws_secret_key" {}
*/
variable "aws_region" {
  description = "EC2 Region for the VPC"
}

// Below are Variables related aws LB
//variables for target group
//variables for target group
variable "n_target_group_name" {
  type        = string
  default     = "Cafe-alb-target1"
  description = "The name for the default target group, uses a module label name if left empty"
}
variable "n_target_type" {
  type        = string
  default     = "instance"
  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "n_health_check_port" {
  type        = string
  default     = "traffic-port"
  description = "The port to use for the healthcheck"
}
variable "n_health_check_healthy_threshold" {
  type        = number
  default     = 3
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}
variable "n_health_check_unhealthy_threshold" {
  type        = number
  default     = 3
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}
variable "n_health_check_interval" {
  type        = number
  default     = 10
  description = "The duration in seconds in between health checks"
}
variable "n_protocol" {
  type        = string
  default     = "HTTP"
  description = "The protocol for the default target group"
}
variable "n_port" {
  type        = number
  default     = 80
  description = "The port for the default target group"
}
variable "n_vpc_id" {
  type        = string
  description = "The VPC Id of the VPC on whicg Load balancer will be used."
}