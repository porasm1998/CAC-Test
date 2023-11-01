variable "description" {
  type        = string
  description = "(Optional) Description of the EC2 Transit Gateway."
  default     = "AWS Transit Gateway"

}

variable "amazon_side_asn" {
  type        = string
  description = "(Optional) Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512."
}

variable "auto_accept_shared_attachments" {
  type        = string
  description = "(Optional) Whether resource attachment requests are automatically accepted. Valid values: disable, enable. Default value: disable."
  default     = "disable"
}

variable "default_route_table_association" {
  type        = string
  description = "(Optional) Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. Default value: enable."
  default     = "enable"
}

variable "default_route_table_propagation" {
  type        = string
  description = "(Optional) Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable. Default value: enable."
  default     = "enable"
}

variable "dns_support" {
  type        = string
  description = " (Optional) Whether DNS support is enabled. Valid values: disable, enable. Default value: enable."
  default     = "enable"

}

variable "multicast_support" {
  type        = string
  description = "(Optional) Whether Multicast support is enabled. Required to use ec2_transit_gateway_multicast_domain. Valid values: disable, enable. Default value: disable."
  default     = "disable"
}

variable "transit_gateway_cidr_blocks" {
  type        = list(string)
  description = " (Optional) One or more IPv4 or IPv6 CIDR blocks for the transit gateway. Must be a size /24 CIDR block or larger for IPv4, or a size /64 CIDR block or larger for IPv6."
}

variable "vpn_ecmp_support" {
  type        = string
  description = " (Optional) Whether VPN Equal Cost Multipath Protocol support is enabled. Valid values: disable, enable. Default value: enable."
  default     = "enable"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value tags for the EC2 Transit Gateway. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}