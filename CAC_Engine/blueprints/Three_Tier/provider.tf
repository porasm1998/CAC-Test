provider "aws" {
  access_key = var.aws_access_key1
  secret_key = var.aws_secret_key1
  region     = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "cac-aws-tfstate"
    key    = "terraform/AWS_CAC_Engine_state/blueprint/Three_Tier"
    region = "us-west-2"
    credentials {
      
    }
  }
}