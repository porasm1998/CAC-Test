//Below are variables specific to user account and other componenets 

variable "aws_region" {
  description = "EC2 Region for the VPC"
}

//Defined variables related to VPC and route table.
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_rt_id" {
  type        = string
  description = "private route table ID"
}
