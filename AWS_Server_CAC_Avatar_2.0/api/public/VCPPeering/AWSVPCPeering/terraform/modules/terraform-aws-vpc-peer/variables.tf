##### VPC variables ######

variable "peer_vpc_id" {
  type        = string
  description = "VPC ID-1"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "VPC ID-2"
  default     = ""
}
variable "peering_connection_name" {
  type        = string
  description = "Peering Connection Name"
  default     = "Peering Connection-1"
}

variable "peer_vpc_route_table" {
  type        = string
  description = "VPC1 Main Route Table ID"
  default     = ""
}

variable "vpc_route_table" {
  type        = string
  description = "VPC2 Main Route Table ID"
  default     = ""
}

variable "cidr_vpc_peer" {
  type        = string
  description = "CIDR range of VPC 1"
  default     = ""
}
variable "cidr_vpc" {
  type        = string
  description = "CIDR range of VPC 2"
  default     = ""
}