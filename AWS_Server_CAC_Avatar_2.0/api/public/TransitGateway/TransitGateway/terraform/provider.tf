/*Make sure to change/update the region and profile according to your enviroment
  Make sure to have latest value for the following fields in the genmab_dev.tfvars file 
  access key
  secrete key
  Note : since all the above fileds have limited expiry, need to change everytime else tfvar file values will not work.
*/
provider "aws" {
  region     = var.aws_region
}