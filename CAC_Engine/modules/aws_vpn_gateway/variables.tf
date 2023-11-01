
variable "vpc_id" {
  description = "(Optional) The VPC ID to create in."
  type        = string
}

variable "availability_zone" {
  description = " (Optional) The Availability Zone for the virtual private gateway."
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}