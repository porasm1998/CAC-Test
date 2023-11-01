//Defined variables related to VPC and route table.
variable "aws_region" {
  type        = string
  description = "aws region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_rt_id" {
  type        = string
  description = "private route table ID"
}

//Defined variables related to VPC endpoint tags for s3 and Dynamodb
variable "vpc_s3_endpoint_tags" {
  description = "VPC Endpoint tags"
  default     =  {
  "Name"     = "S3-endpoint"
  SystemName  = "cafe"
  Env         = "Test"
}
}

variable "vpc_dynamodb_endpoint_tags" {
  description = "VPC Endpoint tags"
  default     =  {
  "Name"     = "Dynamodb-endpoint"
  SystemName  = "cafe"
  Env         = "Test"
}
}


 