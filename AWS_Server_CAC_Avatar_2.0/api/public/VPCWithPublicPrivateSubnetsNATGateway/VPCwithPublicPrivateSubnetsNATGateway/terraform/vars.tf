//Below are variables specific to user account and other componenets 

variable "aws_region" {
    description = "EC2 Region for the VPC"
   }
   
// Variables related to VPC--------------------------------------------------------------------------

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_block" {
  type        = list(any)
  description = "public subnet CIDR blocks"
}

variable "private_subnet_cidr_block" {
  type        = list(any)
  description = "private subnet CIDR blocks"
}

variable "availability_zone" {
  type        = list(any)
  description = "availability zone"
}

variable "eip_count" {
  type        = number
  description = "Elastic Ip"
}

