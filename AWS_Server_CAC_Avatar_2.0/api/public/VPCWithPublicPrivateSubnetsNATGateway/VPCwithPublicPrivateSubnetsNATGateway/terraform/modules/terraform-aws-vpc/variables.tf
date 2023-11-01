##### VPC variables ######

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
}

variable "instance_tenancy" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "default"
}

variable "map_public_ip_on_launch" {
  type        = string
  description = "CIDR block for the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = string
  description = "enable dns support"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = string
  description = "enable dns hostnames"
  default     = true
}

variable "enable_classiclink" {
  type        = string
  description = "enable classiclink"
  default     = false
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

variable "vpc_tags" {
  description = "vpc tags"
  default = {
    Name         = "VPC"
  }
}

variable "eip_count" {
  type        = number
  description = "elastic ip"
  default     = 0
}


