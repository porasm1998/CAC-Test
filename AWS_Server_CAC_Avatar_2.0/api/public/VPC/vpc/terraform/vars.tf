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

variable "Nametag" {
  description = "vpc tags"
  type = string
}