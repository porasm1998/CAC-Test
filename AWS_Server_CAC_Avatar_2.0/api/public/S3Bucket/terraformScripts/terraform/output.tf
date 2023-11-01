// Dispaly resources names and ids

output "bucket_id" {
  value       = module.s3.bucket_name
  description = "S3 Bucket ID"
}

output "bucket_arn" {
  value       = module.s3.bucket_arn
  description = "S3 Bucket ARN"
}