//Below are variables specific to user account and other componenets 

variable "aws_region" {
    description = "EC2 Region for the VPC"
   }
   
##### Use Case Specific variables ######

variable "VPC_ID1" {
  type        = string
  description = "VPC ID-1"
  default     = ""
}

variable "VPC_ID2" {
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

variable "cidr_vpc1" {
  type        = string
  description = "CIDR rangle of VPC 1"
  default     = ""
}
variable "cidr_vpc2" {
  type        = string
  description = "CIDR rangle of VPC 2"
  default     = ""
}