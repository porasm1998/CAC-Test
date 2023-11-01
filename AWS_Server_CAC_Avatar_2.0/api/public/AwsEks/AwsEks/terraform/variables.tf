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
    description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. The value must be configured and increased to upgrade the version when desired. Downgrades are not supported by EKS."
    type = number
}

variable "endpoint_private_access" {
    description = "Whether the Amazon EKS private API server endpoint is enabled. Default is false."
    type = bool
}
variable "endpoint_public_access" {
    description = "Optional) Whether the Amazon EKS public API server endpoint is enabled. Default is true"
    type = bool
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

