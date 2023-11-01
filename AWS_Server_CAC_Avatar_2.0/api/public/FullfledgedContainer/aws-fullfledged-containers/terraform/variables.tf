variable "aws_region" {
  type = string
  description = "EC2 Region for the VPC"
}
/* variable "aws_access_key"{
  type = string
}
variable "aws_secret_key"{
  type = string
} */
variable "aws_accountid" {
  type = string
  description = "AWS AccountID"
}
variable "provider_count" {
  default = "1"
}

#variable "managed_termination" {
 # default = "ENABLED"
  #type = string
#}

variable "maximum_scaling"{
  default = 10
  type = number

}

variable "minimum_scaling"{
  default = 1
  type = number
  
}

variable "status"{
  default = "ENABLED"
  type = string
  
}

variable "target_capacity_count"{
  default = 1
  type = number 

}

variable "cluster_name" {
   default = "my-cluster"
   type = string
}

variable "cap_prov" {
   default = "cap_prov"
   type = string
}

variable "ecs_service_name"{
    default="cac-service"
    type = string

}

variable "ecs_service_count"{
    default = 2
    type = number
}

variable "scheduling_strategy"{
    default = "REPLICA"
    type = string
}

variable "deployment_controller_type"{
    default = "EXTERNAL"
    type = string
}

variable "container_port"{
    default = 8080
    type= number
}

variable "family_type"{
    default = "task1"
    type = string 
}

variable "asg_name"{
   default = "cac_asg"
   type = string
}

variable "desired_capacity_count"{
  default = 2
  type=number
}

variable "asg_min_size"{
  default=1
  type=number
}

variable "asg_max_size"{
  default=10
  type=number
}

variable "health_check"{
  default="EC2"
  type=string 
}

variable "image_id"{
 
  type= string
}

/* variable "containers_tag"{
    
    description="list of maps"
    type=map(string)
} */

// Below are variables specific to user account and other componenets 

// Below are Variables related to VPC and security group.

variable "availability_zones" {
  
  type = list(any)
}


// Below are Variables related to EC2 Instance

variable "instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "web_server_image"{
  description  = "The Web-Apache docker image URL"
}
variable "db_server_image"{
  description  = "The Web-Apache docker image URL"
}








