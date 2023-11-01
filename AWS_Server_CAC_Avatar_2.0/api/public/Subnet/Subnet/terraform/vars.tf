//Below are variables specific to user account and other componenets 


variable "aws_region" {
  description = "AWS Region for the vpc"
  default     = ""
}

// Variables related to vpc--------------------------------------------------------------------------


variable "vpc_id" {
  description = "vpc id for sg"
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

