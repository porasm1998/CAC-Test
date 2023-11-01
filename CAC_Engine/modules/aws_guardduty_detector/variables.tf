variable "enable_guard_duty" {
  type        = bool
  description = "(Optional) Enable monitoring and feedback reporting. Setting to false is equivalent to suspending GuardDuty. Defaults to true."
  default     = true
}

variable "finding_publishing_frequency" {
  type        = string
  description = "(Optional) Specifies the frequency of notifications sent for subsequent finding occurrences. If the detector is a GuardDuty member account, the value is determined by the GuardDuty primary account and cannot be modified, otherwise defaults to SIX_HOURS. For standalone and GuardDuty primary accounts, it must be configured in Terraform to enable drift detection. Valid values for standalone and primary accounts: FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS. See AWS Documentation for more information."
  default     = "FIFTEEN_MINUTES"
}
  
variable "s3_logs_enable" {
  type        = bool
  description = "(Required) If true, enables S3 protection. Defaults to true."
  default     = true
}

variable "kb_audit_logs_enable" {
  type        = bool
  description = "(Required) If true, enables Kubernetes audit logs as a data source for Kubernetes protection. Defaults to true."
  default     = true
}

variable "ebs_malware_protection_enable" {
  type        = bool
  description = "(Required) If true, enables Malware Protection as data source for the detector. Defaults to true."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
