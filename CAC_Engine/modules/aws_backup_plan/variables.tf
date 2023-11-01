variable "backup_plan_name" {
  type        = string
  description = "(Required) The display name of a backup plan."
}

variable "rule_name" {
  type        = string
  description = "(Required) An display name for a backup rule"
}

variable "target_vault_name" {
  type        = string
  description = "(Required) The name of a logical container where backups are stored."
}

variable "cron_schedule" {
  type        = string
  description = "(Optional) A CRON expression specifying when AWS Backup initiates a backup job."
}

variable "enable_continuous_backup" {
  type        = bool
  description = "(Optional) Enable continuous backups for supported resources."
  default     = false
}

variable "start_window" {
  type        = number
  description = "(Optional) The amount of time in minutes before beginning a backup."
  default     = 8
}

variable "completion_window" {
  type        = number
  description = "(Optional) The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error."
  default     = 7
}

variable "cold_storage_after" {
  type        = number
  description = "(Optional) Specifies the number of days after creation that a recovery point is moved to cold storage."
  default     = 7
}

variable "delete_after" {
  type        = number
  description = "(Optional) Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after."
  default     = 10
}

variable "destination_vault_arn" {
  type        = string
  description = "(Required) An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup."
}

variable "recovery_point_tags" {
  type        = map(string)
  description = "(Optional) Metadata that you can assign to help organize the resources that you create."
}

variable "Windows_VSS" {
  type        = string
  description = "(Required) Specifies the backup option for a selected resource. This option is only available for Windows VSS backup jobs. Set to { WindowsVSS = enabled } to enable Windows VSS backup option and create a VSS Windows backup."
  default     = "enabled"
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
