##### vpc variables ######

variable "vpc_id" {
  description = "vpc id for security group"
  type        = string
  
}




variable "subnet_cidr" {
  description = "subnet cidr block"
  type        = list(string)
}

variable "availability_zone_subnet" {
  description = "availablity zone for subnet"
  type        = list(string)
}

variable "Nametag" {
  description = "Environmentname for subnet"
  type        = list(string)
}

