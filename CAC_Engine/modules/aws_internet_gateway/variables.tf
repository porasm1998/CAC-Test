
variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
