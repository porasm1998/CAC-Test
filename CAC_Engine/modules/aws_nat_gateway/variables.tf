variable "allocation_id" {
  type        = string
  description = "(Optional) The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public."
  default = null
}

variable "subnet_id" {
  type        = string
  description = "(Required) The Subnet ID of the subnet in which to place the gateway."
}

variable "connectivity_type" {
  type        = string
  description = "(Optional) Connectivity type for the gateway. Valid values are private and public. Defaults to public."
  default     = "public"
}

variable "private_ip" {
  type        = string
  description = "(Optional) The private IPv4 address to assign to the NAT gateway. If you don't provide an address, a private IPv4 address will be automatically assigned."
  default = null
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
