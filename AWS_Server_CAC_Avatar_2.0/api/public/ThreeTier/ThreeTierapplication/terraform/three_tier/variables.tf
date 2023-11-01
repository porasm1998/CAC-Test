// vpc variables ------------------------------------------------
variable "vpc_cidr_block" {
    description = "cidr for the vpc"
    type = string
    
}

variable "vpc_Name" {
    description = "Name of the vpc"
    type = string
    
}


// web subnet details------------------------------------------
variable "web-subnet-1_cidr_block" {
    description = "web subnet 1 cidr block"
    type = string
    
}

variable "web-subnet-2_cidr_block" {
    description = "web subnet 2 cidr block"
    type = string
    
}

variable "web-subnet-1_Name" {
    description = "web subnet 1 name"
    type = string
    
}

variable "web-subnet-2_Name" {
    description = "web subnet 2 name"
    type = string
   
}

variable "web-subnet-1_availability_zone" {
    description = "az for subnet"
    type = string
    
}

variable "web-subnet-2_availability_zone" {
    description = "az for subnet"
    type = string
    
}

//app subnet details-------------------------------------------
variable "app-subnet-1_cidr_block" {
    description = "app subnet 1 cird block"
    type = string
    
}

variable "app-subnet-2_cidr_block" {
    description = "app subnet 2 cird block"
    type = string
   
}

variable "app-subnet-1_Name" {
    description = "app subnet 1 name"
    type = string
    
}

variable "app-subnet-2_Name" {
    description = "app subnet 1 name"
    type = string
   
}

variable "app-subnet-1_availability_zone" {
    description = "az for subnet"
    type = string
    
}

variable "app-subnet-2_availability_zone" {
    description = "az for subnet"
    type = string
    
}

//db subnet details-----------------------------------------------

variable "db-subnet-1_cidr_block" {
    description = "db subnet 1 cird block"
    type = string
    
}

variable "db-subnet-2_cidr_block" {
    description = "db subnet 2 cird block"
    type = string
    
}

variable "db-subnet-1_Name" {
    description = "db subnet 1 name"
    type = string
    
}

variable "db-subnet-2_Name" {
    description = "db subnet 1 name"
    type = string
    
}
variable "db-subnet-1_availability_zone" {
    description = "az for subnet"
    type = string
    
}

variable "db-subnet-2_availability_zone" {
    description = "az for subnet"
    type = string
    
}

// internet gateway variables ----------------------

variable "ig_name" {
  type        = string
  description = "tag for internet gateway"
  default     = "internet_gateway"
}

// route table --------------------------------------

variable "route_table_name" {
  type        = string
  description = "name tag"
  default = "test-route-table"
}



// variables for web1 & web2
variable "web_ami_id" {
  
  type        = string
  description = "The AMI to use for the instance"
}
variable "web_instance_type" {
  
  type        = string
  description = "The type of instance to start"
}
variable "key_name" {
  
  type        = string
  description = "The key name to use for the instance"
}

variable "associate_public_ip_address" {
  default     = true
  type        = string
  description = "associate public ip address"
}

/* variable "root_block_device_encrypted" {
  type        = bool
  default     = false
  description = "Whether to encrypt the root block device"
} */

// variables for ebs volume
variable "Create_ebs" {
  default     = true
  type        = bool
  description = "create the ebs volume unless false"
}

variable "ebs_volume_type" {
  default     = "gp2"
  type        = string
  description = "The type of the additional EBS volumes. Can be standard, gp2 or io1"
}
variable "ebs_volume_size" {
  default     = "5"
  type        = number
  description = "Size of the additional EBS volumes in gigabytes"
}
variable "ebs_volume_encrypted" {
  default     = true
  type        = bool
  description = "Whether to encrypt"
}

// variable for web ebs vol attachment
variable "ebs_volume_name" {
  default = "/dev/sdb"
  type        = string
  description = "Name of the EBS device to mount"
}

//variables for creating alb
variable "alb_name"{
  type        = string
  default     = "Cafe-alb"
  description = "The name for the default load balancer, uses a module label name if left empty"
}
variable "load_balancer_type"{
  type        = string
  default     = "application"
  description = "The type of load balancer to create. Possible values are application or network. The default value is application."
}
variable "internal"{
  type        = bool
  default     = false
  description = "A boolean flag to determine whether the ALB should be internal"
}
variable "enable_cross_zone_load_balancing"{
  type        = bool
  default     = true
  description = "Indicates whether cross zone load balancing should be enabled in application load balancers."
}
variable "enable_deletion_protection"{
  type        = bool
  default     = false
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
}

//variables for alb listener
variable "protocol"{
  type        = string
  default     = "HTTP"
  description = "The protocol for the default target group"
}
variable "port"{
  type        = number
  default     = 80
  description = "The port for the default target group"
}
variable "alb_listener_type"{
  type        = string
  default     = "forward"
  description = "The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
}

//variables for target group
variable "target_group_name"{
  type        = string
  default     = "Cafe-alb-target1"
  description = "The name for the default target group, uses a module label name if left empty"
}
variable "target_type"{
  type        = string
  default     = "instance"
  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "health_check_port"{
  type        = string
  default     = "traffic-port"
  description = "The port to use for the healthcheck"
}
variable "health_check_healthy_threshold"{
   type        = number
  default     = 3
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}
variable "health_check_unhealthy_threshold"{
   type        = number
  default     = 3
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}
variable "health_check_interval"{
   type        = number
  default     = 10
  description = "The duration in seconds in between health checks"
}
variable "ec2_port"{
  type        = number
  default     = 80
  description = "The port for the ec2"
}

//2nd tier

variable "app_ami_id" {
  type        = string
  description = "The AMI to use for the instance"
}
variable "app_instance_type" {
  type        = string
  description = "The type of instance to start"
}

//variables for creating alb
variable "nlb_name"{
  type        = string
  default     = "Cafe-nlb"
  description = "The name for the default load balancer, uses a module label name if left empty"
}
variable "n_load_balancer_type"{
  type        = string
  default     = "network"
  description = "The type of load balancer to create. Possible values are application or network. The default value is application."
}
variable "n_internal"{
  type        = bool
  default     = false
  description = "A boolean flag to determine whether the NLB should be internal"
}
variable "n_enable_cross_zone_load_balancing"{
  type        = bool
  default     = true
  description = "Indicates whether cross zone load balancing should be enabled in application load balancers."
}
variable "n_enable_deletion_protection"{
  type        = bool
  default     = false
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
}

//variables for alb listener
variable "n_protocol"{
  type        = string
  default     = "TCP"
  description = "The protocol for the default target group"
}
variable "n_port"{
  type        = number
  default     = 80
  description = "The port for the default target group"
}
variable "nlb_listener_type"{
  type        = string
  default     = "forward"
  description = "The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
}

//variables for target group
variable "n_target_group_name"{
  type        = string
  default     = "Cafe-nlb-target1"
  description = "The name for the default target group, uses a module label name if left empty"
}
variable "n_target_type"{
  type        = string
  default     = "instance"
  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "n_health_check_port"{
  type        = string
  default     = "traffic-port"
  description = "The port to use for the healthcheck"
}
variable "n_health_check_healthy_threshold"{
   type        = number
  default     = 3
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}
variable "n_health_check_unhealthy_threshold"{
   type        = number
  default     = 3
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}
variable "n_health_check_interval"{
   type        = number
  default     = 10
  description = "The duration in seconds in between health checks"
}
variable "n_ec2_port"{
  type        = number
  default     = 80
  description = "The port for the ec2"
}

//third tier

variable "db_ami_id" {
  type        = string
  description = "The AMI to use for the instance"
}
variable "db_instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "bucket_name" {
  type = string
  description = "name of bucket"
}



