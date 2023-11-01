variable "aws_region" {
  type        = string
  description = "(Required) AWS region where the provider will operate. The region must be set. Can also be set with either the AWS_REGION or AWS_DEFAULT_REGION environment variables, or via a shared config file parameter region if profile is used. If credentials are retrieved from the EC2 Instance Metadata Service, the region can also be retrieved from the metadata."
}

variable "aws_access_key1" {
  description = "AWS Access Key."
  type        = string
}
variable "aws_secret_key1" {
  description = " AWS Secret Key."
  type        = string
}

variable "prefix" {
  type = string
}

variable "usecase" {
  type        = string
  description = "(Required) Name of the Usecase created"
}

variable "environment" {
  type        = string
  description = "(Required) Name of the Environment"
}

variable "cidr_block1" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}

variable "subnet_cidr_1" {
  description = "Web subnet I cidr block"
  type        = string
}

variable "subnet_cidr_2" {
  description = "App subnet I cidr block"
  type        = string
}

variable "subnet_cidr_3" {
  description = "DB subnet I cidr block"
  type        = string
}

variable "subnet_cidr_4" {
  description = "Web subnet II cidr block"
  type        = string
}

variable "subnet_cidr_5" {
  description = "App subnet II cidr block"
  type        = string
}

variable "subnet_cidr_6" {
  description = "DB subnet II cidr block"
  type        = string
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default     = false
}

variable "availability_zone" {
  description = "availablity zone for subnet"
  type        = string
}
