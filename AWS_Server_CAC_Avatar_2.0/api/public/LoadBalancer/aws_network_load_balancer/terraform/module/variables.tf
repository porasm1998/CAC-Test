variable "lb" {
type = string
description = "Name of the Load Balancer"
}

variable "internal" {
type = bool
description = "type of Internal stage true or false"
default = false
}

variable "load_balancer_type" {
  type = string
  description = "Type of Load Balancer"
  
}
variable "enable_deletion_protection" {
type = bool
description = "Value of Detection Protection is to be anables or not"
default = false
}

variable "environment" {
type = string
description= "Type of Load Balancer Environment"
}

variable "subnet_id" {
type = list(any)
description = "the subnet ID"
}

 

 

 

 

#subnets            = [for subnet in aws_subnet.public : subnet.id]

 