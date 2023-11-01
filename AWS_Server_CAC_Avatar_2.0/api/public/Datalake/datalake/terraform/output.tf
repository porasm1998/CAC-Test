// Dispaly resources names and ids

output "s3_bucket_raw" {
  value       = module.s3_raw.bucket_id_raw
  description = "Bucket name"
}

output "s3_bucket_raw_arn" {
  value       = module.s3_raw.bucket_arn_raw
  description = "Bucket ARN"
}


output "s3_bucket_processed" {
  value       = module.s3_raw.bucket_id_processed
  description = "Bucket name"
}

output "s3_bucket_processed_arn" {
  value       = module.s3_raw.bucket_arn_processed
  description = "Bucket ARN"
}

output "lake_db_name" {
  value       = module.glue.aws_glue_catalog_database
  description = "lake formation databse name"
}

output "glue_crawler_name" {
  value       = module.glue.aws_glue_crawler
  description = "glue crawler name"
}

