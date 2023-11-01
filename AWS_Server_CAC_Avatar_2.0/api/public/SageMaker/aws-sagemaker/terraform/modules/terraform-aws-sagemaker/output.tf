// Dispaly resources names and ids

output "sagemaker_notebook_instance_id" {
  value       = aws_sagemaker_notebook_instance.default.id
  description = "Sagemaker Instance ID"
}

output "sagemaker_notebookinstance_arn" {
  value       = aws_sagemaker_notebook_instance.default.arn
  description = "Sagemaker Instance ARN"
}
