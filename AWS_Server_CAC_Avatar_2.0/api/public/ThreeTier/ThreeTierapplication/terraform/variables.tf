// vpc variables ------------------------------------------------
variable "vpc_cidr_block" {
  description = "cidr for the vpc"
  type        = string

}

variable "vpc_Name" {
  description = "Name of the vpc"
  type        = string

}


// web subnet details------------------------------------------
variable "web-subnet-1_cidr_block" {
  description = "web subnet 1 cidr block"
  type        = string

}

variable "web-subnet-2_cidr_block" {
  description = "web subnet 2 cidr block"
  type        = string

}

variable "web-subnet-1_Name" {
  description = "web subnet 1 name"
  type        = string

}

variable "web-subnet-2_Name" {
  description = "web subnet 2 name"
  type        = string

}

variable "web-subnet-1_availability_zone" {
  description = "az for subnet"
  type        = string

}

variable "web-subnet-2_availability_zone" {
  description = "az for subnet"
  type        = string

}

//app subnet details-------------------------------------------
variable "app-subnet-1_cidr_block" {
  description = "app subnet 1 cird block"
  type        = string

}

variable "app-subnet-2_cidr_block" {
  description = "app subnet 2 cird block"
  type        = string

}

variable "app-subnet-1_Name" {
  description = "app subnet 1 name"
  type        = string

}

variable "app-subnet-2_Name" {
  description = "app subnet 1 name"
  type        = string

}

variable "app-subnet-1_availability_zone" {
  description = "az for subnet"
  type        = string

}

variable "app-subnet-2_availability_zone" {
  description = "az for subnet"
  type        = string

}

//db subnet details-----------------------------------------------

variable "db-subnet-1_cidr_block" {
  description = "db subnet 1 cird block"
  type        = string

}

variable "db-subnet-2_cidr_block" {
  description = "db subnet 2 cird block"
  type        = string

}

variable "db-subnet-1_Name" {
  description = "db subnet 1 name"
  type        = string

}

variable "db-subnet-2_Name" {
  description = "db subnet 1 name"
  type        = string

}
variable "db-subnet-1_availability_zone" {
  description = "az for subnet"
  type        = string

}

variable "db-subnet-2_availability_zone" {
  description = "az for subnet"
  type        = string

}

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

variable "app_ami_id" {
  type        = string
  description = "The AMI to use for the instance"
}
variable "app_instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "db_ami_id" {
  type        = string
  description = "The AMI to use for the instance"
}
variable "db_instance_type" {
  type        = string
  description = "The type of instance to start"
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
}

variable "bucket_name" {
  type        = string
  description = "name of bucket"
}


