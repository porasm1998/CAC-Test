//Below are variables specific to user account and other componenets 

/* variable "aws_access_key" {
  type = string
  }
variable "aws_secret_key" {
  type = string
  } */
variable "aws_region" {
    description = "EC2 Region for the VPC"
}

//Variables related to S3 Buckets--------------------------------------------------------------------------

variable "aws_account" {
 description = "The AWS account id"
 type        = string
}

variable "s3_bucket_raw" {
 description = "The s3 bucket name"
 type        = string
}

variable "s3_bucket_processed" {
 description = "The s3 bucket name"
 type        = string
}

//Variables related to Data Lake--------------------------------------------------------------------------

variable "lake_db_name" {
  description = "The lake formation databse name"
  type        =  string
}

variable "glue_crawler_name" {
 description  = "The glue crawler name"
  type        =  string
}


//variables related to Glue crawler role

variable "glue_crawler_role" {
    description = "The glue crawler role name"
    type        = string
  
}

//variables related to Data Lake Administrator

variable "data_lake_admin" {
    description = "Data Lake Administrator name"
    type        = string
}

variable "workgroup_name" {
    description = "Name of the Athena Workgroup"
    type        = string
}


