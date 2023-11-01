resource "aws_kms_key" "kms_key" {
  description                        = var.description
  key_usage                          = var.key_usage
  custom_key_store_id                = var.custom_key_store_id
  customer_master_key_spec           = var.customer_master_key_spec
  policy                             = var.policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  deletion_window_in_days            = var.deletion_window_in_days
  is_enabled                         = var.is_kms_key_enabled
  enable_key_rotation                = var.enable_key_rotation
  multi_region                       = var.multi_region
  tags                               = var.tags
}