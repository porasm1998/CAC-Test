// Dispaly resources names and ids
output "aws_iam_role" {
  value       = aws_iam_role.workflow_role.id
  description = "IAM role name"
}

output "aws_iam_role_arn" {
  value       = aws_iam_role.workflow_role.arn
  description = "IAM role arn"
}

output "aws_glue_catalog_database" {
  value       = aws_glue_catalog_database.glue_catalog_database_vendor.id
  description = "lake formation databse name"
}

output "aws_glue_crawler" {
  value       = aws_glue_crawler.crawler_vendor.id
  description = "glue crawler name"
}

output "aws_iam_user" {
  value       = aws_iam_user.datalake_admin.id
  description = "data lake admin name"
}
