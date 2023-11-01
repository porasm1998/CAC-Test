variable "cidr_block" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}

variable "instance_tenancy" {
  type        = string
  description = "(Optional) A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch. This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee."
  default     = "default"
}

variable "enable_dns_support" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults to true."
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  default     = false
}

variable "enable_network_address_usage_metrics" {
  type        = bool
  description = "(Optional) Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
