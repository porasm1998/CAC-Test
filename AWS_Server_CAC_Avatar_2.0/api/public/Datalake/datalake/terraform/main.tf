/*
This module will create Data Lake Administrator, lake-fomation database, Glue crawler and provide database
permissions for glue crawlers for database. Register S3 location in lake formation.
*/

// s3 module
module "s3_raw" {
  source              = "./modules/terraform-aws-s3"
  aws_account         = var.aws_account
  s3_bucket_raw       = var.s3_bucket_raw
  s3_bucket_processed = var.s3_bucket_processed
}

// Data lake module
module "glue" {
  source              = "./modules/terraform-aws-lake-formation"
  lake_db_name        = var.lake_db_name
  glue_crawler_name   = var.glue_crawler_name
  s3_bucket_raw       = var.s3_bucket_raw
  s3_bucket_processed = var.s3_bucket_processed
  data_lake_admin     = var.data_lake_admin
  glue_crawler_role   = var.glue_crawler_role
  workgroup_name      = var.workgroup_name
}

