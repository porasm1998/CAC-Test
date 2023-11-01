/* data "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket
} */
resource "aws_flow_log" "flow_log" {
  log_destination      = var.s3_arn
  log_destination_type = var.log_destination_type
  traffic_type         = var.traffic_type
  vpc_id               = var.vpc_id
  destination_options {
    file_format        = var.file_format
    per_hour_partition = var.per_hour_partition
    hive_compatible_partitions = var.hive_compatible_partitions
  }
}

