output "vpc_1_id" {
  value = module.vpc_1.vpc_id
}

output "vpc_2_id" {
  value = module.vpc_2.vpc_id
}

output "vpc_peering_id" {
  value = module.vpc_peering.vpc_peering_id
}

output "subnet_1_id" {
  value       = module.subnet_1.subnet_id
}

output "nat_id" {
  value = module.nat_gateway.nat_id
}

output "igw_1_id" {
  value = module.internet_gateway.aws_internet_gateway_id
}

output "rt_1_id" {
  value = module.route_table_1.rt_id
}

output "topic_id" {
  value = module.sns_topic.topic_id
}

output "firewall_id" {
  value = module.firewall.firewall_id
}

output "kms_key_id" {
  value = module.kms_key.kms_key_id
}

output "kms_key_arn" {
  value = module.kms_key.kms_key_arn
}

# output "guard_duty_detector_id" {
#   value = module.guard_duty_detector.guard_duty_detector_id
# }

output "security_hub_account_id" {
  value = module.security_hub.security_hub_account_id
}

output "security_action_target_id" {
  value = module.security_hub.security_action_target_id
}

output "backup_vault_id" {
  value = module.backup_vault.backup_vault_id
}

output "log_group_arn" {
  value = module.cloudwatch.log_group_arn
}

output "log_stream_arn" {
  value = module.cloudwatch.log_stream_arn
}

output "sg_1_id" {
  value = module.security_grp_1.security_grp_id
}

output "s3_bucket_1_id" {
  value = module.s3_bucket_1.s3_bucket_id
}

output "vpn_gw_1_id" {
  value = module.vpn_gateway.vpn_gw_1_id
}

output "flow_log_id" {
  value = module.aws_flow_log.flow_log_id
}

output "transit_gateway_id" {
  value = module.aws_transit_gateway.tg_id
}

output "vpc_endpoint_id" {
  value = module.vpc_endpoint.vpc_endpoint_id
}

output "backup_vault_arn" {
  value = module.backup_vault.backup_vault_arn
}

/* output "secret_manager_secret_id" {
  value = module.secret.secret_manager_secret_id
} */

output "ebs_volume_id" {
  value = module.ebs_volume.ebs_volume_id
}

output "backup_plan_id" {
  value = module.backup_plan.backup_plan_id
}

output "dx_gateway_id" {
  value = module.aws_dx_gateway.dx_gateway_id
}
