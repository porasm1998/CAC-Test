//Below are variables specific to user account and other componenets 

variable "aws_region" {
    description = "EC2 Region"
   }
   
// Variables related to Sagemaker instance--------------------------------------------------------------------------

variable "name" {
  type        = string
  description = "Name of the sagemaker instance"
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "Instance type of sagemaker instance"
  default     = ""
}