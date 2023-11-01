resource "aws_backup_vault" "MyVault" {
  name          = var.backup_vault_name
  force_destroy = var.backup_vault_force_destroy
  depends_on =  [var.kms_key_id]
  tags          = var.tags
}