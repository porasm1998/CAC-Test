//variables specific to your region and user credentials

variable "aws_region" {
  default     = ""
}

//bucket related variables
variable "s3_bucket_raw" {
  description = "The RAW s3 bucket name"
  type        = string
  default     = "rawdata-landing01"
}

variable "s3_bucket_processed" {
  description = "The PROCESSED s3 bucket name"
  type        = string
  default     = "processeddata01"
}

variable "s3_gmb_sub_folders" {
  description = "The SUB Folders inside both s3 bucket name"
  type        = list(any)
  default     = ["data"]
}

variable "bucket_acl" {
  description = "The bucket ACL to apply"
  type        = string
  default     = "private"
}

variable "glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  default     = 7
}

variable "storage_class" {
  description = "storage_class"
  default     = "GLACIER"
}

variable "Lifecycle_rule_enabled" {
  description = "enbale life cycle rule"
  default     = true
}

variable "s3_tags" {
  description = "The s3 tags"
  default      = {
    SystemName = "Infosys"
    Env        = "Dev"
  }
}

//variables related to S3 KMS encryption
variable "s3_sse_algorithm" {
  description = "The server-side encryption algorithm to use"
  type        = string
  default     = "aws:kms"
}

variable "aws_account" {
 description = "The AWS account id"
 type        = string
 default     = ""
}










 