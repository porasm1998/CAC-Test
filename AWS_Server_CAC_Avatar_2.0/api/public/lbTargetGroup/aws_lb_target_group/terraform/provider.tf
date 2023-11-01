/*Make sure to change/update the region and profile according to your enviroment
  Make sure to have latest value for the following fields in the .tfvars file 
  access key
  secrete key
  Note : since all the above fileds have limited expiry, need to change everytime else .tfvar file values will not work.

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}
*/