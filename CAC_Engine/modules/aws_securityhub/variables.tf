variable "enable_default_standards" {
  type        = bool
  description = "(Optional) Whether to enable the security standards that Security Hub has designated as automatically enabled including: AWS Foundational Security Best Practices v1.0.0 and CIS AWS Foundations Benchmark v1.2.0. Defaults to true."
  default     = true
}

variable "control_finding_generator" {
  type        = string
  description = "(Optional) Updates whether the calling account has consolidated control findings turned on. If the value for this field is set to SECURITY_CONTROL, Security Hub generates a single finding for a control check even when the check applies to multiple enabled standards. If the value for this field is set to STANDARD_CONTROL, Security Hub generates separate findings for a control check when the check applies to multiple enabled standards. For accounts that are part of an organization, this value can only be updated in the administrator account."
  default     = "SECURITY_CONTROL"
}

variable "auto_enable_controls" {
  type        = bool
  description = "(Optional) Whether to automatically enable new controls when they are added to standards that are enabled. By default, this is set to true, and new controls are enabled automatically. To not automatically enable new controls, set this to false."
  default     = true
}

variable "target_name" {
  type        = string
  description = "(Required) The name for the custom action target."
}

variable "identifier" {
  type        = string
  description = "(Required) The ID for the custom action target."
  default     = "SendToChat"
}

variable "description" {
  type        = string
  description = "(Required) The description for the custom action target."
  default     = "This is custom action sends selected findings to chat"
}


