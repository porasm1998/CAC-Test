variable "ebs_availablility_zone" {
  type        = string
  description = "(Required) The AZ where the EBS volume will exist."
}

variable "ebs_encrypted" {
  type        = bool
  description = "(Optional) If true, the disk will be encrypted."
  default     = true
}

variable "final_snapshot" {
  type        = bool
  description = "(Optional) If true, snapshot will be created before volume deletion. Any tags on the volume will be migrated to the snapshot. By default set to false."
  default     = false
}

variable "iops" {
  type        = number
  description = "(Optional) The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3. Min: 3000 IOPS, Max: 16000 IOPS. The value must be an integer."
  default     = 3000
}

variable "multi_attach_enabled" {
  type        = bool
  description = "(Optional) Specifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported on io1 and io2 volumes."
  default     = false
}

variable "ebs_size" {
  type        = number
  description = "(Optional) The size of the drive in GiBs. Min: 1 GiB, Max: 16384 GiB. The value must be an integer."
  default     = 32
}

variable "outpost_arn" {
  type        = bool
  description = "(Optional) The Amazon Resource Name (ARN) of the Outpost."
  default     = null
}

variable "ebs_type" {
  type        = string
  description = "(Optional) The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)."
  default     = "io1"
}

variable "kms_key_arn" {
  type        = string
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true. Note: Terraform must be running with credentials which have the GenerateDataKeyWithoutPlaintext permission on the specified KMS key as required by the EBS KMS CMK volume provisioning process to prevent a volume from being created and almost immediately deleted."
}

variable "throughput" {
  type        = number
  description = "(Optional) Only valid for type of gp3. The throughput that the volume supports, in MiB/s.  Min: 125 MiB, Max: 1000 MiB. Baseline: 125 MiB/s."
  default     = 125
}

variable "tags" {
  type        = map(string)
  description = "(Required) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}
