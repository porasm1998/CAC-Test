variable "secret_manager_name" {
  type        = string
  description = "(Optional) Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@- Conflicts with name_prefix."
}

variable "secret_manager_description" {
  type        = string
  description = "(Optional) Description of the secret."
  default = "New Secret to be created in Secrets Manager"
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret. If you need to reference a CMK in a different account, you can use only the key ARN. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default KMS key (the one named aws/secretsmanager). If the default KMS key with that name doesn't yet exist, then AWS Secrets Manager creates it for you automatically the first time."
  default = null
}

variable "aws_secretsmanager_secret_policy" {
  type        = string
  description = "(Optional) Valid JSON document representing a resource policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. Removing policy from your configuration or setting policy to null or an empty string  will not delete the policy since it could have been set by aws_secretsmanager_secret_policy. To delete the policy, set it to {} (an empty JSON document)."
  default     = null
}

variable "recovery_window_in_days" {
  type        = number
  description = "(Optional) Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. The default value is 30."
  default     = 30
}

variable "secret_replica_region" {
  type        = string
  description = "(Required) Region for replicating the secret."
}

variable "force_overwrite_replica_secret" {
  type        = bool
  description = "(Optional) Accepts boolean value to specify whether to overwrite a secret with the same name in the destination Region."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
