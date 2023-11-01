variable "backup_vault_name" {
  type        = string
  description = "(Required) Name of the backup vault to create."
}

variable "backup_vault_force_destroy" {
  type        = string
  description = " (Optional, Default: false) A boolean that indicates that all recovery points stored in the vault are deleted so that the vault can be destroyed without error."
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) The server-side encryption key that is used to protect your backups."
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
