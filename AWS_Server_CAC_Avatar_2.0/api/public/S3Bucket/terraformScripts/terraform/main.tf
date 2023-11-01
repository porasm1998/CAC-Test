/*
This module will create VPC, Public subnet, Private subnet, Internet gateway
*/

// vpc module

module "s3" {
  source                     = "./modules/terraform-aws-s3"
  bucket_name                = var.bucket_name
}

