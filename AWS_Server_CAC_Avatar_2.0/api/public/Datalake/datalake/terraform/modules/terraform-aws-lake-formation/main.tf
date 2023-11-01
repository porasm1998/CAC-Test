/*
This template will create lake-fomation database,Glue crawler and provide database
permissions for glue crawler for database. Register S3 location in lake formation 
*/

// Create database 
resource "aws_glue_catalog_database" "glue_catalog_database_vendor" {
  name = var.lake_db_name
  location_uri = "s3://${var.s3_bucket_raw}"
}

// Register Location
resource "aws_lakeformation_resource" "lakeformation_vendor1" {
  arn = "arn:aws:s3:::${var.s3_bucket_raw}"
}

// provide glue permission to database
resource "aws_lakeformation_permissions" "lakeformation_permissions_vendor" {
  principal     = aws_iam_role.workflow_role.arn
  permissions   = var.db_permissions
  database {
    name        = aws_glue_catalog_database.glue_catalog_database_vendor.name
  }
}

// create glue crawler for database
resource "aws_glue_crawler" "crawler_vendor" {
  database_name = aws_glue_catalog_database.glue_catalog_database_vendor.name
  schedule      = var.crawler_frequency
  name          = var.glue_crawler_name
  role          = aws_iam_role.workflow_role.arn
  s3_target {
    path = "s3://${var.s3_bucket_raw}"
  }
}

// The location in Amazon S3 where query results are stored
resource "aws_athena_workgroup" "example" {
  name = var.workgroup_name
    configuration {
    result_configuration {
      output_location = "s3://${var.s3_bucket_processed}/output/"
    }
    }
}

