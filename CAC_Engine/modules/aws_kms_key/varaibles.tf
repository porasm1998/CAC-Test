variable "description" {
  type        = string
  description = "(Optional) A friendly description of the firewall."
  default     = "KMS key to be created"
}

variable "key_usage" {
  type        = string
  description = "(Optional) Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC. Defaults to ENCRYPT_DECRYPT."
  default     = "ENCRYPT_DECRYPT"
}

variable "custom_key_store_id" {
  type        = string
  description = "(Optional) ID of the KMS Custom Key Store where the key will be stored instead of KMS (eg CloudHSM)."
  default     = null
}

variable "customer_master_key_spec" {
  type        = string
  description = "(Optional) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, HMAC_256, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT. For help with choosing a key spec, see the AWS KMS Developer Guide."
  default     = "SYMMETRIC_DEFAULT"
}

variable "policy" {
  type        = string
  description = "(Optional) A valid policy JSON document. Although this is a key policy, not an IAM policy, an aws_iam_policy_document, in the form that designates a principal, can be used. For more information about building policy documents with Terraform, see the AWS IAM Policy Document Guide."
  default     = null
}

variable "bypass_policy_lockout_safety_check" {
  type        = bool
  description = "(Optional) A flag to indicate whether to bypass the key policy lockout safety check. Setting this value to true increases the risk that the KMS key becomes unmanageable. Do not set this value to true indiscriminately. For more information, refer to the scenario in the Default Key Policy section in the AWS Key Management Service Developer Guide. The default value is false."
  default     = false
}

variable "deletion_window_in_days" {
  type        = number
  description = "(Optional) The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately."
  default     = 30
}

variable "is_kms_key_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
  default     = true
}

variable "enable_key_rotation" {
  type        = bool
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to false."
  default     = false
}

variable "multi_region" {
  type        = bool
  description = "(Optional) Indicates whether the KMS key is a multi-Region (true) or regional (false) key. Defaults to false."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
