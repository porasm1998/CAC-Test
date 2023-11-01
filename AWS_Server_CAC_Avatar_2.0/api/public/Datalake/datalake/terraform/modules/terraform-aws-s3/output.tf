// Dispaly resources names and ids
output "bucket_id_raw" {
  value       = aws_s3_bucket.raw.id
  description = "Bucket ID"
}

output "bucket_id_processed" {
  value       = aws_s3_bucket.processed.id
  description = "Bucket ID"
}

output "bucket_arn_raw" {
  value       = aws_s3_bucket.raw.arn
  description = "Bucket ARN"
}

output "bucket_arn_processed" {
  value       = aws_s3_bucket.processed.arn
  description = "Bucket ARN"
}

output "bucket_bucket_domain_name_raw" {
  value       = aws_s3_bucket.raw.bucket_domain_name
  description = "Bucket domain name"
}

output "bucket_bucket_domain_nameprocessed" {
  value       = aws_s3_bucket.processed.bucket_domain_name
  description = "Bucket domain name"
}
