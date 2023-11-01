// Dispaly resources names and ids

output "bucket_name" {
  value       = aws_s3_bucket.b.id
  description = "S3 Bucket ID"
}

output "bucket_arn" {
  value       = aws_s3_bucket.b.arn
  description = "S3 Bucket ARN"
}

