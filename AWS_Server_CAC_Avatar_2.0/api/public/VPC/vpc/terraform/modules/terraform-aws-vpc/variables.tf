##### VPC variables ######

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = ""
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

/* variable "enable_classiclink" {
  type        = string
  description = "enable classiclink"
  default     = false
} */

variable "Nametag" {
  description = "vpc tags"
  type = string
}