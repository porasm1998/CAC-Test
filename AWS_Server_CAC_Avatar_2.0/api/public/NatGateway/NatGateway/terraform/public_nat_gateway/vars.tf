variable "allocation_id" {
  type        = string
  description = "tag for internet gateway"
  
}

variable "subnet_id" {
  type        = string
  description = "subnet id"
}
variable "name" {
  type        = string
  description = "name of nat gateway"
}