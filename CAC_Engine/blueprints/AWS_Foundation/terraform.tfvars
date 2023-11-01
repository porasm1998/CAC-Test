prefix      = "iac"
usecase     = "aws-foundation"
environment = "dev"

aws_region = "us-west-2"

# VPC
cidr_block1 = "10.1.0.0/16"
cidr_block2 = "10.2.0.0/16"

# subnet 
subnet_cidr       = "10.1.0.0/24"
availability_zone = "us-west-2a"

# sns-topic
email_addresses = ["snscac@gmail.com"]

# NAT Gateway
allocation_id     = "eipalloc-032705b986e041585"
connectivity_type = "public"

# Firewall
vpc_firewall_policy_arn = "arn:aws:network-firewall:us-west-2:181597866704:firewall-policy/cac-test-policy"

# KMS KEY
deletion_window_in_days = 25
is_kms_key_enabled      = true

# # Guard Duty Detector
# s3_logs_enable                = true
# kb_audit_logs_enable          = true
# ebs_malware_protection_enable = true

# Security Hub
enable_default_standards  = true
control_finding_generator = "SECURITY_CONTROL"
auto_enable_controls      = true
target_name               = "Chat Notification"

# Backup Vault
backup_vault_force_destroy = true

# Security Group
ingress_from_port = 443
ingress_to_port   = 443
ingress_protocol  = "tcp"
egress_from_port  = 0
egress_to_port    = 0
egress_protocol   = "-1"

# Flow log
log_destination_type = "s3"
traffic_type         = "ALL"

# Transit Gateway
amazon_side_asn1            = "64512"
transit_gateway_cidr_blocks = ["10.0.0.0/16"]

# VPC endpoint type 
service_name = "com.amazonaws.us-west-2.s3"

# Secret Manager Secret
secret_replica_region = "us-west-1"

# EBS Volume
ebs_availablility_zone = "us-west-2a"
ebs_encrypted          = true
iops                   = 3000
ebs_size               = 100
ebs_type               = "io1"
throughput             = null

# Backup Plan
cron_schedule      = "cron(0 12 * * ? *)"
start_window       = 60
completion_window  = 120
cold_storage_after = 0
delete_after       = 30

# Direct Connection Gateway
amazon_side_asn2 = "64512"