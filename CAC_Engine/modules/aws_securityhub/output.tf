output "security_hub_account_id" {
  value = aws_securityhub_account.security_hub_account.id
}

output "security_action_target_id" {
  value = aws_securityhub_action_target.action_target.id
}