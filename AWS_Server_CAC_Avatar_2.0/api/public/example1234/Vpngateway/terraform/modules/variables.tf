variable "project_id" {
  type        = string
  description = "(Required) Project ID where the gateway belongs"
}

variable "region_name" {
  type        = string
  description = "(Required) Region the gateway should be created in"
}

variable "gateway_name" {
  type        = string
  description = "(Required) Name for the cloud VPN"
}

variable "network_name" {
  type        = string
  description = "(Required) VPC Network for which the VPN is accepting traffic"
}