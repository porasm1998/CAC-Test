variable "aws_region" {
  type        = string
  description = "(Required) AWS region where the provider will operate. The region must be set. Can also be set with either the AWS_REGION or AWS_DEFAULT_REGION environment variables, or via a shared config file parameter region if profile is used. If credentials are retrieved from the EC2 Instance Metadata Service, the region can also be retrieved from the metadata."
}

variable "aws_access_key1" {
  description = "AWS Access Key."
  type        = string
}
variable "aws_secret_key1" {
  description = " AWS Secret Key."
  type        = string
}

variable "prefix" {
  type = string
}

variable "usecase" {
  type        = string
  description = "(Required) Name of the Usecase created"
}

variable "environment" {
  type        = string
  description = "(Required) Name of the Environment"
}

variable "cidr_block1" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}

variable "cidr_block2" {
  type        = string
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using ipv4_netmask_length."
}

variable "subnet_cidr" {
  description = "subnet cidr block"
  type        = string
}

variable "availability_zone" {
  description = "availablity zone for subnet"
  type        = string
}

# NAT Gateway
variable "allocation_id" {
  type        = string
  description = "(Optional) The Allocation ID of the Elastic IP address for the gateway. Required for connectivity_type of public."
}

variable "private_ip" {
  type        = string
  description = "(Optional) The private IPv4 address to assign to the NAT gateway. If you don't provide an address, a private IPv4 address will be automatically assigned."
  default     = null
}

variable "connectivity_type" {
  type        = string
  description = "(Optional) Connectivity type for the gateway. Valid values are private and public. Defaults to public."
  default     = "public"
}
variable "ingress_from_port" {
  type        = number
  description = "Required) Start port (or ICMP type number if protocol is icmp or icmpv6)."
}

# SNS Topic
variable "email_addresses" {
  type        = list(string)
  description = "The email addresses to subscribe to the SNS topic"
}

# Firewall
variable "vpc_firewall_policy_arn" {
  type        = string
  description = "(Required) The  ARN of the VPC Firewall policy."
}

# KMS Key
variable "deletion_window_in_days" {
  type        = number
  description = "(Optional) The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30. If the KMS key is a multi-Region primary key with replicas, the waiting period begins when the last of its replica keys is deleted. Otherwise, the waiting period begins immediately."
  default     = 30
}

variable "is_kms_key_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the key is enabled. Defaults to true."
  default     = true
}

# # Guard Duty Detector
# variable "s3_logs_enable" {
#   type        = bool
#   description = "(Required) If true, enables S3 protection. Defaults to true."
#   default     = true
# }

# variable "kb_audit_logs_enable" {
#   type        = bool
#   description = "(Required) If true, enables Kubernetes audit logs as a data source for Kubernetes protection. Defaults to true."
#   default     = true
# }

# variable "ebs_malware_protection_enable" {
#   type        = bool
#   description = "(Required) If true, enables Malware Protection as data source for the detector. Defaults to true."
#   default     = true
# }

# Security Hub
variable "enable_default_standards" {
  type        = bool
  description = "(Optional) Whether to enable the security standards that Security Hub has designated as automatically enabled including: AWS Foundational Security Best Practices v1.0.0 and CIS AWS Foundations Benchmark v1.2.0. Defaults to true."
  default     = true
}

variable "control_finding_generator" {
  type        = string
  description = "(Optional) Updates whether the calling account has consolidated control findings turned on. If the value for this field is set to SECURITY_CONTROL, Security Hub generates a single finding for a control check even when the check applies to multiple enabled standards. If the value for this field is set to STANDARD_CONTROL, Security Hub generates separate findings for a control check when the check applies to multiple enabled standards. For accounts that are part of an organization, this value can only be updated in the administrator account."
  default     = "SECURITY_CONTROL"
}

variable "auto_enable_controls" {
  type        = bool
  description = "(Optional) Whether to automatically enable new controls when they are added to standards that are enabled. By default, this is set to true, and new controls are enabled automatically. To not automatically enable new controls, set this to false."
  default     = true
}

variable "target_name" {
  type        = string
  description = "(Required) The name for the custom action target."
}

# Backup Vault
variable "backup_vault_force_destroy" {
  type        = string
  description = " (Optional, Default: false) A boolean that indicates that all recovery points stored in the vault are deleted so that the vault can be destroyed without error."
  default     = false
}

variable "ingress_to_port" {
  type        = number
  description = "(Required) End range port (or ICMP code if protocol is icmp)."
}

variable "ingress_protocol" {
  type        = string
  description = " (Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument on the IpPermission API reference. This argument is normalized to a lowercase value to match the AWS API requirement when using with Terraform 0.12.x and above, please make sure that the value of the protocol is specified as lowercase when using with older version of Terraform to avoid an issue during upgrade."
}

variable "egress_from_port" {
  type        = number
  description = "(Required) Start port (or ICMP type number if protocol is icmp)"
}

variable "egress_to_port" {
  type        = number
  description = "(Required) End range port (or ICMP code if protocol is icmp)."
}

variable "egress_protocol" {
  type        = number
  description = "(Required) Protocol. If you select a protocol of -1 (semantically equivalent to all, which is not a valid value here), you must specify a from_port and to_port equal to 0. The supported values are defined in the IpProtocol argument in the IpPermission API reference. This argument is normalized to a lowercase value to match the AWS API requirement when using Terraform 0.12.x and above. Please make sure that the value of the protocol is specified as lowercase when used with older version of Terraform to avoid issues during upgrade."
}

variable "log_destination_type" {
  type        = string
  description = " (Optional) The type of the logging destination. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs."
}

variable "traffic_type" {
  type        = string
  description = " (Required) The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL."
}


variable "amazon_side_asn1" {
  type        = string
  description = "(Optional) Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512."
}

variable "transit_gateway_cidr_blocks" {
  type        = list(string)
  description = " (Optional) One or more IPv4 or IPv6 CIDR blocks for the transit gateway. Must be a size /24 CIDR block or larger for IPv4, or a size /64 CIDR block or larger for IPv6."
}

variable "service_name" {
  description = "(Required) The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook)."
  type        = string
}

# Secret Manager Secret
variable "secret_replica_region" {
  type        = string
  description = "(Required) Region for replicating the secret."
}

# EBS Volume
variable "ebs_availablility_zone" {
  type        = string
  description = "(Required) The AZ where the EBS volume will exist."
}

variable "ebs_encrypted" {
  type        = bool
  description = "(Optional) If true, the disk will be encrypted."
  default     = true
}

variable "iops" {
  type        = number
  description = "(Optional) The amount of IOPS to provision for the disk. Only valid for type of io1, io2 or gp3. Min: 3000 IOPS, Max: 16000 IOPS. The value must be an integer."
  default     = 3000
}

variable "ebs_size" {
  type        = number
  description = "(Optional) The size of the drive in GiBs. Min: 1 GiB, Max: 16384 GiB. The value must be an integer."
  default     = 32
}

variable "ebs_type" {
  type        = string
  description = "(Optional) The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)."
  default     = "io1"
}

variable "throughput" {
  type        = number
  description = "(Optional) Only valid for type of gp3. The throughput that the volume supports, in MiB/s.  Min: 125 MiB, Max: 1000 MiB. Baseline: 125 MiB/s."
  default     = 125
}

# Backup Plan 
variable "cron_schedule" {
  type        = string
  description = "(Optional) A CRON expression specifying when AWS Backup initiates a backup job."
}

variable "start_window" {
  type        = number
  description = "(Optional) The amount of time in minutes before beginning a backup."
  default     = 8
}

variable "completion_window" {
  type        = number
  description = "(Optional) The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error."
  default     = 7
}

variable "cold_storage_after" {
  type        = number
  description = "(Optional) Specifies the number of days after creation that a recovery point is moved to cold storage."
  default     = 7
}

variable "delete_after" {
  type        = number
  description = "(Optional) Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after."
  default     = 7
}
variable "amazon_side_asn2" {
  type        = number
  description = "- (Required) The ASN to be configured on the Amazon side of the connection. The ASN must be in the private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294."
}