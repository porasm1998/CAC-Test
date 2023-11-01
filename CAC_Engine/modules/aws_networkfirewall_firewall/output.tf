output "firewall_id" {
  value = aws_networkfirewall_firewall.firewall.id
}

# output "vpc_firewall_policy_arn" {
#   value = data.aws_networkfirewall_firewall_policy.example.arn
# }