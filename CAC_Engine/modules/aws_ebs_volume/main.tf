resource "aws_ebs_volume" "ebs" {
  availability_zone    = var.ebs_availablility_zone
  encrypted            = var.ebs_encrypted
  final_snapshot       = var.final_snapshot
  iops                 = var.iops
  multi_attach_enabled = var.multi_attach_enabled
  size                 = var.ebs_size
  outpost_arn          = var.outpost_arn
  type                 = var.ebs_type
  kms_key_id           = var.kms_key_arn
  throughput           = var.throughput
  tags                 = var.tags
}