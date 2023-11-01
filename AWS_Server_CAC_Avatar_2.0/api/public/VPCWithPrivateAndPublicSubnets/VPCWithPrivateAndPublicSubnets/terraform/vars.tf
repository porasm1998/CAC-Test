//Below are variables specific to user account and other componenets 


variable "aws_region" {
    description = "EC2 Region for the VPC"
   }
   
// Variables related to VPC--------------------------------------------------------------------------

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}

variable "public_subnet_cidr_block" {
  type        = list(any)
  description = "public subnet CIDR blocks"
  default     = [""]
}

variable "private_subnet_cidr_block" {
  type        = list(any)
  description = "private subnet CIDR blocks"
  default     = [""]
}

variable "availability_zone" {
  type        = list(any)
  description = "availability zone"
  default     = [""]
}