variable "lb" {
  type = string
  description = "Name of the Load Balancer"
}
variable "load_balancer_type" {
  type = string
  description = "Type of Load Balancer"
  
}
variable "environment" {
  type = string
  description = "Type of Load Balancer Environment"
}

variable "region" {
  type = string
  description = "The Place where the Load balancer will be plaed"
}

variable "subnet_id" {
  type = list(any)
  description = "the subnet ID"
}