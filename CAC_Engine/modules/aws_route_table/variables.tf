variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID."

}

variable "cidr_block" {
  type        = string
  description = "(Required) The CIDR block of the route."
}

variable "internet_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC internet gateway."
}

/* variable "ipv6_cidr_block" {
  type        = string
  description = "(Optional) The Ipv6 CIDR block of the route."
}

variable "nat_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC NAT gateway."
} */


variable "tags" {
  type        = map(string)
  description = " (Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}