module "flowlog" {
  source                     = "./modules/aws-vpcflowlog"
  iam_role_arn               = var.iam_role_arn
  log_destination            = var.log_destination
  vpc_id                     = var.vpc_id

}