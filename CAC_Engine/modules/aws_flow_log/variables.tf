variable "s3_arn" {
  type        = string
  description = " (Optional, Forces new resource) Name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. A full list of bucket naming rules may be found here."
}

variable "log_destination_type" {
  type        = string
  description = " (Optional) The type of the logging destination. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs."
}

variable "traffic_type" {
  type        = string
  description = " (Required) The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL."
}

variable "vpc_id" {
  type        = string
  description = "  (Optional) VPC ID to attach to"
}

variable "file_format" {
  type        = string
  description = " (Optional) The format for the flow log. Default value: plain-text. Valid values: plain-text, parquet."
  default = "plain-text"
}

variable "per_hour_partition" {
  type        = string
  description = "(Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries. Default value: false."
  default = "false"
}

variable "hive_compatible_partitions"{
    type= bool
    description="(Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. Default value: false."
    default = "false"
}
