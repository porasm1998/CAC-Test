resource "aws_backup_plan" "Backup_Plan" {
  name = var.backup_plan_name

  rule {
    rule_name                = var.rule_name
    target_vault_name        = var.target_vault_name
    schedule                 = var.cron_schedule
    enable_continuous_backup = var.enable_continuous_backup
    start_window             = var.start_window
    completion_window        = var.completion_window

    copy_action {
      lifecycle {
        cold_storage_after = var.cold_storage_after
        delete_after       = var.delete_after
      }
      destination_vault_arn = var.destination_vault_arn
    }
    recovery_point_tags = var.recovery_point_tags
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = var.Windows_VSS
    }
    resource_type = "EC2"
  }
  tags = var.tags
}