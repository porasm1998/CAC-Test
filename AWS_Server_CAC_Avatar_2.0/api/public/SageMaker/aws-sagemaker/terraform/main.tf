/*
This module will create Sagemaker instance
*/

// sagemaker module

module "sagemaker" {
  source          = "./modules/terraform-aws-sagemaker"
  name            = var.name
  instance_type   = var.instance_type
}