resource "aws_securityhub_account" "security_hub_account" {
  enable_default_standards  = var.enable_default_standards
  control_finding_generator = var.control_finding_generator
  auto_enable_controls      = var.auto_enable_controls
}

resource "aws_securityhub_action_target" "action_target" {
  depends_on  = [aws_securityhub_account.security_hub_account]
  name        = var.target_name
  identifier  = var.identifier
  description = var.description
}