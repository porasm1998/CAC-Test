
module "vpc_1" {
  source     = "../../modules/aws_vpc"
  cidr_block = var.cidr_block1
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test12-vpc"
    Environment = "Dev"
  }
}

module "vpc_2" {
  source     = "../../modules/aws_vpc"
  cidr_block = var.cidr_block2
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test21-vpc"
    Environment = "Dev"
  }
}

module "subnet_1" {
  source            = "../../modules/aws_subnet"
  vpc_id            = module.vpc_1.vpc_id
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test1-subnet"
    Environment = "Dev"
  }
}

module "vpc_peering" {
  source        = "../../modules/aws_vpc_peering_connection"
  vpc_id        = module.vpc_1.vpc_id
  peer_vpc_id   = module.vpc_2.vpc_id
  aws_region    = var.aws_region
  peer_owner_id = "181597866704"
}

module "nat_gateway" {
  source            = "../../modules/aws_nat_gateway"
  allocation_id     = var.allocation_id
  private_ip        = var.private_ip
  subnet_id         = module.subnet_1.subnet_1_id
  connectivity_type = var.connectivity_type
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test9-nat-gw"
    Environment = "Dev"
  }
}

module "internet_gateway" {
  source = "../../modules/aws_internet_gateway"
  vpc_id = module.vpc_1.vpc_id
  tags = {
    Name = "${var.prefix}-${var.usecase}-${var.environment}-test1-igw"
  }
}

module "route_table_1" {
  source              = "../../modules/aws_route_table"
  vpc_id              = module.vpc_1.vpc_id
  cidr_block          = "10.0.1.0/24"
  internet_gateway_id = module.internet_gateway.aws_internet_gateway_id
  tags = {
    Name = "${var.prefix}-${var.usecase}-${var.environment}-test1-rt"
  }

}

module "sns_topic" {
  source          = "../../modules/aws_sns_topic"
  topic_name      = "${var.prefix}-${var.usecase}-${var.environment}-test1-snstopic"
  email_addresses = var.email_addresses
}

module "firewall" {
  source                  = "../../modules/aws_networkfirewall_firewall"
  firewall_name           = "${var.prefix}-${var.usecase}-${var.environment}-firewall"
  vpc_firewall_policy_arn = var.vpc_firewall_policy_arn
  vpc_id                  = module.vpc_1.vpc_id
  subnet_id               = module.subnet_1.subnet_1_id
  key_id                  = module.kms_key.kms_key_id
  tags = {
    Environment = "Dev"
  }
}

module "kms_key" {
  source                  = "../../modules/aws_kms_key"
  deletion_window_in_days = var.deletion_window_in_days
  is_kms_key_enabled      = var.is_kms_key_enabled
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test3-kms-key"
    Environment = "Dev"
  }
}

# module "guard_duty_detector" {
 #  source                        = "../../modules/aws_guardduty_detector"
  # s3_logs_enable                = var.s3_logs_enable
 #  kb_audit_logs_enable          = var.kb_audit_logs_enable
  # ebs_malware_protection_enable = var.ebs_malware_protection_enable
   #tags = {
    # Name        = "${var.prefix}-${var.usecase}-${var.environment}-test1-guard-duty-detector"
     #Environment = "Dev"
   #}
 #} 

module "security_hub" {
  source                    = "../../modules/aws_securityhub"
  enable_default_standards  = var.enable_default_standards
  control_finding_generator = var.control_finding_generator
  auto_enable_controls      = var.auto_enable_controls
  target_name               = var.target_name
}

module "backup_vault" {
  source                     = "../../modules/aws_backup_vault"
  backup_vault_name          = "${var.prefix}-${var.usecase}-${var.environment}-test1-backup-vault"
  backup_vault_force_destroy = var.backup_vault_force_destroy
  kms_key_id                 = module.kms_key.kms_key_id
  tags = {
    Environment = "Dev"
  }
}

module "cloudwatch" {
  source              = "../../modules/aws_cloudwatch_log_group"
  cloudwatch_log_name = "${var.prefix}-${var.usecase}-${var.environment}-test1-cloudwatch"
  log_stream_name     = "${var.prefix}-${var.usecase}-${var.environment}-test1-cloudwatchlogstream"
  tags = {
    Environment = "${var.prefix}-${var.usecase}-${var.environment}-test1-production"
    Application = "serviceA"
  }
}

module "security_grp_1" {
  source            = "../../modules/aws_security_group"
  vpc_id            = module.vpc_1.vpc_id
  security_group    = "${var.prefix}-${var.usecase}-${var.environment}-test1-sg"
  ingress_from_port = var.ingress_from_port
  ingress_to_port   = var.ingress_to_port
  ingress_protocol  = var.ingress_protocol
  egress_from_port  = var.egress_from_port
  egress_to_port    = var.egress_to_port
  egress_protocol   = var.egress_protocol
  egress_cidr_block = ["0.0.0.0/0"]
  tags = {
    Name = "${var.prefix}-${var.usecase}-${var.environment}-test1-sg-tag"
  }
}

module "s3_bucket_1" {
  source    = "../../modules/aws_s3_bucket"
  s3_bucket = "${var.prefix}-${var.usecase}-${var.environment}-test1-s3-bucket"
  tags = {
    Name = "${var.prefix}-${var.usecase}-${var.environment}-test1-s3-bucket-tag"
  }
}

# module "secret" {
#   source                = "../../modules/aws_secretsmanager_secret"
#   secret_manager_name   = "${var.prefix}-${var.usecase}-${var.environment}-test5-sercret"
#   kms_key_id            = module.kms_key.kms_key_id
#   secret_replica_region = var.secret_replica_region
#   tags = {
#     Environment = "Dev"
#   }
# }

module "aws_flow_log" {
  source               = "../../modules/aws_flow_log"
  log_destination_type = var.log_destination_type
  traffic_type         = var.traffic_type
  vpc_id               = module.vpc_1.vpc_id
  s3_arn               = "arn:aws:s3:::${var.prefix}-${var.usecase}-${var.environment}-test1-s3-bucket"
}

module "vpn_gateway" {
  source            = "../../modules/aws_vpn_gateway"
  vpc_id            = module.vpc_2.vpc_id
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.prefix}-${var.usecase}-${var.environment}-test1-vpngw"
  }
}

module "aws_transit_gateway" {
  source                      = "../../modules/aws_ec2_transit_gateway"
  amazon_side_asn             = var.amazon_side_asn1
  transit_gateway_cidr_blocks = var.transit_gateway_cidr_blocks
  tags = {
    Name = "${var.prefix}-${var.usecase}-${var.environment}-test1-tg-tag"
  }
}

module "vpc_endpoint" {
  source       = "../../modules/aws_vpc_endpoint"
  vpc_id       = module.vpc_2.vpc_id
  service_name = var.service_name
  tags = {
    Environment = "${var.prefix}-${var.usecase}-${var.environment}-test1-vpc-endpoint"
  }
}

module "ebs_volume" {
  source                 = "../../modules/aws_ebs_volume"
  ebs_availablility_zone = var.ebs_availablility_zone
  ebs_encrypted          = var.ebs_encrypted
  iops                   = var.iops
  ebs_size               = var.ebs_size
  ebs_type               = var.ebs_type
  kms_key_arn            = module.kms_key.kms_key_arn
  throughput             = var.throughput
  tags = {
    Name        = "${var.prefix}-${var.usecase}-${var.environment}-test1-ebs-volume"
    Environment = "Dev"
  }
  depends_on = [module.kms_key]
}

module "backup_plan" {
  source                = "../../modules/aws_backup_plan"
  backup_plan_name      = "${var.prefix}-${var.usecase}-${var.environment}-test1-backup-plan"
  rule_name             = "${var.prefix}-${var.usecase}-${var.environment}-test1-backup-rule"
  target_vault_name     = "${var.prefix}-${var.usecase}-${var.environment}-test1-backup-vault"
  cron_schedule         = var.cron_schedule
  start_window          = var.start_window
  completion_window     = var.completion_window
  cold_storage_after    = var.cold_storage_after
  delete_after          = var.delete_after
  destination_vault_arn = module.backup_vault.backup_vault_arn
  recovery_point_tags = {
    Environment = "Dev"
  }
  tags = {
    Environment = "Dev"
  }
}

module "aws_dx_gateway" {
  source                    = "../../modules/aws_dx_gateway"
  direct_connection_gateway = "${var.prefix}-${var.usecase}-${var.environment}-test1-dx-gateway"
  amazon_side_asn           = var.amazon_side_asn2
} 
