
variable "aws_region" {
  description = "EC2 Region for the VPC"
}

variable "vpc_cidr" {
  description = "vpc cidr for security group"
  type        = string
  
}
variable "vpc_name" {
  description = "vpc cidr for security group"
  type        = string
  
}

variable "subnet1_cidr_block" {
    type = string
}
variable "subnet2_cidr_block" {
    type = string
}
variable "subnet3_cidr_block" {
    type = string
}

variable "availability_zone1"{
    type = string
}
variable "availability_zone2"{
    type = string
}
variable "availability_zone3"{
    type = string
}





variable "cluster_name" {
    description = "Name of the cluster"
    type = string
}

variable "eks_version" {
    description = "version of the cluster"
    type = number
}

variable "endpoint_private_access" {
    description = "clster api endpoint"
    type = string
}
variable "endpoint_public_access" {
    description = "clster api endpoint"
    type = string
}

variable "node_group_name" {
    description = "Node group name"
    type = string
}

variable "desired_size" {
    description = "Node group name"
    type = number
}
variable "max_size" {
    description = "Node group name"
    type = number
}
variable "min_size" {
    description = "Node group name"
    type = number
}

