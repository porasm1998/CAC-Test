output "backup_vault_id" {
  value = aws_backup_vault.MyVault.id
}

output "backup_vault_arn" {
  value = aws_backup_vault.MyVault.arn
}