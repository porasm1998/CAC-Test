variable "firewall_name" {
  type        = string
  description = " (Required, Forces new resource) A friendly name of the firewall."
}

# variable "firewall_policy_name" {
#   type        = string
#   description = "(Required) The  Name of the VPC Firewall policy."
# }

variable "vpc_firewall_policy_arn" {
  type        = string
  description = "(Required) The  ARN of the VPC Firewall policy."
}

variable "vpc_id" {
  type        = string
  description = "(Required, Forces new resource) The unique identifier of the VPC where AWS Network Firewall should create the firewall."
}

variable "delete_protection" {
  type        = bool
  description = "(Optional) A boolean flag indicating whether it is possible to delete the firewall. Defaults to false."
  default     = false
}

variable "description" {
  type        = string
  description = "(Optional) A friendly description of the firewall."
  default     = "Firewall to be created"
}

variable "key_id" {
  type        = string
  description = "(Optional) The ID of the customer managed key. You can use any of the key identifiers that KMS supports, unless you're using a key that's managed by another account. If you're using a key managed by another account, then specify the key ARN."
  default     = null
}

variable "type" {
  type        = string
  description = "(Required) The type of AWS KMS key to use for encryption of your Network Firewall resources. Valid values are CUSTOMER_KMS and AWS_OWNED_KMS_KEY."
  default     = "CUSTOMER_KMS"
}

variable "firewall_policy_change_protection" {
  type        = bool
  description = "(Option) A boolean flag indicating whether it is possible to change the associated firewall policy. Defaults to false."
  default     = false
}

variable "subnet_change_protection" {
  type        = bool
  description = "(Optional) A boolean flag indicating whether it is possible to change the associated subnet(s). Defaults to false."
  default     = false
}

variable "ip_address_type" {
  type        = string
  description = " (Optional) The subnet's IP address type. Valida values: DUALSTACK, IPV4"
  default     = "IPV4"
}

variable "subnet_id" {
  type        = string
  description = "(Optional) The private IPv4 address to assign to the NAT gateway. If you don't provide an address, a private IPv4 address will be automatically assigned."
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
