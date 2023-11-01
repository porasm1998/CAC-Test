# Terraform module to provission sns with email protocol
module "sns" {
  source                              = "./modules/terraform-aws-sns"
  sns_subscription_email_address_list = var.sns_subscription_email_address_list
  sns_topic_name                      = var.sns_topic_name
  stack_name                          = var.stack_name
}

