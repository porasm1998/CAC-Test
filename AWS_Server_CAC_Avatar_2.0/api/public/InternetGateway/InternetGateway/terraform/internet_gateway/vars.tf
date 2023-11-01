variable "name" {
  type        = string
  description = "tag for internet gateway"
  default     = "internet_gateway"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}
