// Below are variables specific to user account 
variable "aws_region" {
  description = "Region for the Transit gateway"
}

// VPC and its components related variables
variable "vpc1" {
  type        = string
  description = "VPC1 ID"
}

variable "vpc2" {
  type        = string
  description = "VPC2 ID"
}
variable "vpc1_subnet_ids" {
  type        = list(any)
  description = "vpc1 subnet ids list"
}
variable "vpc2_subnet_ids" {
  type        = list(any)
  description = "vpc2 subnet ids list"
}
variable "vpc1_route_table_id" {
  type        = string
  description = "vpc route table ID of VPC1"
}
variable "vpc2_route_table_id" {
  type        = string
  description = "vpc route table ID of VPC2"
}
// Transit Gateway related varaibles
variable "destination_cidr_block1" {
  type        = string
  description = "destination cidr block1"
}
variable "destination_cidr_block2" {
  type        = string
  description = "destination cidr block2"
}
