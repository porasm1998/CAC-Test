// varibales related to s3 buckets

variable "s3_bucket_raw" {
  description = "The RAW s3 bucket name"
  type        =  string
  default     = "rawdata-landing01"
}

variable "s3_bucket_processed" {
  description = "The processed s3 bucket name"
  type        =  string
  default     = "processeddata01"
}

// variables realted to database and glue crawler

variable "lake_db_name" {
  description = "The lake formation databse name"
  type        =  string
  default     = "lake_db"
}

variable "db_permissions" {
  description = "The databse permission"
  type        =  list(any)
  default     = ["CREATE_TABLE", "ALTER"]
}

variable "glue_crawler_name" {
  description = "The glue crawler name"
  type        =  string
  default     = "lake-crawler"
}

variable "crawler_frequency" {
  default = "cron(*/30 * * * ? *)"
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

