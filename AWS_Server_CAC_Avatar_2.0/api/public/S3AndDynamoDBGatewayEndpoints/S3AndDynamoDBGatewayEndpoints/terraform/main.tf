//This module will create VPC gateway endpoints for services S3 and Dynamodb.

// vpc endpoint module
module "endpoints" {
  source        = "./modules/terraform-aws-vpc-endpoints"
  vpc_id        = var.vpc_id
  private_rt_id = var.private_rt_id
  aws_region    = var.aws_region
}