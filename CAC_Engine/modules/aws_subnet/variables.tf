##### subnet variables ######

variable "vpc_id" {
  description = "vpc id for security group"
  type        = string
}


variable "subnet_cidr" {
  description = "subnet cidr block"
  type        = string
}

variable "availability_zone" {
  description = "availablity zone for subnet"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default     = false
}

variable "assign_ipv6_address_on_creation" {
  type        = string
  description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address."
  default     = false
}
variable "enable_dns64" {
  type        = string
  description = "(Optional) Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations."
  default     = false
}
variable "enable_resource_name_dns_a_record_on_launch" {
  type        = string
  description = "enable_resource_name_dns_a_record_on_launch"
  default     = false
}
variable "ipv6_native" {
  type        = string
  description = "(Optional) Indicates whether to create an IPv6-only subnet."
  default     = false
}
