// Dispaly resources names and ids

output "sagemaker_notebook_instance_id" {
  value       = module.sagemaker.sagemaker_notebook_instance_id
  description = "Sagemaker Instance ID"
}

output "sagemaker_notebook_instance_arn" {
  value       = module.sagemaker.sagemaker_notebookinstance_arn
  description = "Sagemaker Instance ARN"
}
