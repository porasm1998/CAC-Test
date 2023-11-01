variable "aws_region" {
  description = "Region for the Transit gateway"
}
variable "sg_name" {
  type        = string
  description = "security group name"
}
variable "vpc_id" {
  type        = string
  description = "Existing VCP ID"
}
variable "ingress_from_port" {
  type        = number
  description = "Ingress From Port Number"
}
variable "ingress_to_port" {
  type        = number
  description = "Ingress To Port Number"
}
variable "protocol" {
  type        = string
  description = "Ingress Protocol"
}
variable "cidr_block" {
  type        = string
  description = "Existing VCP CIDR"
}

variable "egress_from_port" {
  type        = number
  description = "Egress From Port Number"
}
variable "egress_to_port" {
  type        = number
  description = "Egress To Port Number"
}
variable "egress_protocol" {
  type        = string
  description = "Egress Protocol"
}
variable "tag_name" {
  type        = string
  description = "Tag Name"
}

