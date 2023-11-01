variable "s3_bucket" {
  type        = string
  description = " (Optional, Forces new resource) Name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. A full list of bucket naming rules may be found here."
}

variable "object_lock_enabled" {
  type        = string
  description = " (Optional, Forces new resource) Indicates whether this bucket has an Object Lock configuration enabled. Valid values are true or false. This argument is not supported in all regions or partitions."
  default     = "false"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the bucket. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}



