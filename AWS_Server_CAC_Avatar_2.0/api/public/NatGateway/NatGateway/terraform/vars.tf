

variable "aws_region" {
    type = string
    description = "AWS Region for Nat"
   }

   
variable "name" {
  type        = string
  description = "tag for nat gateway"
  default     = "nat_gateway"
}



variable "allocation_id" {
  type        = string
  description = "elastic ip id"
  
}

variable "subnet_id" {
  type        = string
  description = "subnet id"
}
