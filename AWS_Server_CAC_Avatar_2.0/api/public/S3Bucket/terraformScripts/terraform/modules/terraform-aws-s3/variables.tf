##### S3 variables ######

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name"
  default     = ""
}

variable "s3_tags" {
  description = "s3 tags"
  default = {
    Name        = "S3 Bucket"
    Environment = "Dev"
  }
}

