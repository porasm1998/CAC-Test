# data "aws_networkfirewall_firewall_policy" "example" {
#   name = var.firewall_policy_name
# }

resource "aws_networkfirewall_firewall" "firewall" {
  name                              = var.firewall_name
  firewall_policy_arn               = var.vpc_firewall_policy_arn
  vpc_id                            = var.vpc_id
  delete_protection                 = var.delete_protection
  description                       = var.description
  firewall_policy_change_protection = var.firewall_policy_change_protection
  subnet_change_protection          = var.subnet_change_protection
  encryption_configuration {
    key_id = var.key_id
    type   = var.type
  }
  subnet_mapping {
    ip_address_type = var.ip_address_type
    subnet_id       = var.subnet_id
  }
  tags = var.tags
}




