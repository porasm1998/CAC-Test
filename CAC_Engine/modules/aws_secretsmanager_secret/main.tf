resource "aws_secretsmanager_secret" "secret" {
  name                    = var.secret_manager_name
  description             = var.secret_manager_description
  kms_key_id              = var.kms_key_id
  policy                  = var.aws_secretsmanager_secret_policy
  recovery_window_in_days = var.recovery_window_in_days
  replica {
    kms_key_id = var.kms_key_id
    region     = var.secret_replica_region
  }
  force_overwrite_replica_secret = var.force_overwrite_replica_secret
  tags                           = var.tags
}