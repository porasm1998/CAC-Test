variable "aws_region" {
    type = string
    description = "AWS Region for the S3 bucket"
   }

   
variable "name" {
  type        = string
  description = "tag fr internet gateway"
  default     = "internet_gateway"
}   
// Variables related to VPC--------------------------------------------------------------------------

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}

variable "Nametag" {
  description = "vpc tags"
  type = string
}