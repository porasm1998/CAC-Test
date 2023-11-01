//Below are variables specific to user account and other componenets 

variable "aws_region" {
    description = "AWS Region for the S3 bucket"
   }
   
// Variables related to S3--------------------------------------------------------------------------

variable "bucket_name" {
  type        = string
  description = "Globally unique S3 bucket name"
  default     = ""
}