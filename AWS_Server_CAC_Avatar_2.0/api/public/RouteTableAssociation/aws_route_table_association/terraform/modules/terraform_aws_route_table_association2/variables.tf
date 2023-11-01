//variables for Route Table assocaition
variable "rt_subnet_id"{
  type        = string
  #default     = "Cafe-alb-target1"
  description = "The Identifier of the subnet to be used in creation of Route table and assoication"
}

variable "rt_route_table_id"{
  type        = string
  description = "The Identifier of Route Table to be associated"
}