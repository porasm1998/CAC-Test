// VPC and its components related variables
variable "vpc1"{
  type        = string
  description = "VPC1 ID"
}
variable "vpc2"{

   type       = string
  description = "VPC2 ID"
}

variable "vpc1_subnet_ids"{
  type        = list(any)
  description = "vpc1 subnet ids list"
}

variable "vpc2_subnet_ids"{
  type        = list(any)
  description = "vpc2 subnet ids list"
}

variable "vpc1_route_table_id"{
  type        = string
  description = "vpc route table ID of VPC1"
}

variable "vpc2_route_table_id"{
  type        = string
  description = "vpc route table ID of VPC2"
}

variable "description"{
  type        = string
  description = "transit gateway description"
  default     = "cafe-transit-gateway"
}

// Transit Gateway related varaibles
variable "auto_accept_shared_attachments"{
  type        = string
  description = "enable auto accept shared attachments"
  default     = "enable"
}

variable "default_route_table_association"{
  type        = string
  description = "enable default route table association"
  default     = "enable"
}

variable "default_route_table_propagation"{
  type        = string
  description = "enable default route table propagation"
  default     = "enable"
}

variable "dns_support"{
  type        = string
  description = "enable dns support"
  default     = "enable"
}

variable "vpn_ecmp_support"{
  type        = string
  description = "enable vpn ecmp support"
  default     = "enable"
}

variable "amazon_side_asn"{
  type        = string
  description = "amazon_side_asn"
  default     = 65000
}
variable "destination_cidr_block1"{
  type        = string
  description = "destination cidr block1"
}
variable "destination_cidr_block2"{
  type        = string
  description = "destination cidr block2"
}

variable "tg_tags"{
  description = "Transit gateway tags"
  default     = {
    Name       = "cafe-transit-gateway"
    SystemName = "Infosys"
    Env        = "Test"
  } 
}

variable "tg_attachment1_tags"{
  description = "Transit gateway attachment1 tags"
  default     = {
    Name       = "cafe-VPC-attachment1"
    SystemName = "Infosys"
    Env        = "Test"
}
}

variable "tg_attachment2_tags"{
  description = "Transit gateway attachment2 tags"
  default     = {
    Name       = "cafe-VPC-attachment2"
    SystemName = "Infosys"
    Env        = "Test"
}
}
 