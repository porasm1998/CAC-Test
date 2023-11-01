

variable "aws_region" {
    type = string
    description = "AWS Region for the S3 bucket"
   }

   
variable "name" {
  type        = string
  description = "tag fr internet gateway"
  default     = "internet_gateway"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}


