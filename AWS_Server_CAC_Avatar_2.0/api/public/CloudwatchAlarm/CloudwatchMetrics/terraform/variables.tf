variable "alarm_name" {
    type = string
}

variable "comparison_operator" {
  default     = "GreaterThanOrEqualToThreshold"
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold"
}

variable "evaluation_periods" {
  default     = "1"
  type        = number
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "metric_name" {
  default     = "CPUUtilization"
  type        = string
  description = "The name for the alarm's associated metric."
}

variable "namespace" {
  default     = "AWS/EC2"
  type        = string
  description = "The namespace for the alarm's associated metric."
}

variable "period" {
  default     = "300"  // seconds
  type        = number
  description = "The period in seconds over which the specified statistic is applied"
}

variable "statistic" {
  default     = "Average"
  type        = string
  description = "The statistic to apply to the alarm's associated metric."
}

variable "threshold" {
  default     = "80"
  type        = number
  description = "The value against which the specified statistic is compared"
}

variable "alarm_description" {
  default     = "This metric monitors ec2 cpu utilization"
  type        = string
  description = "TThe description for the alarm"
}


variable "sns_arn" {
    type = string
}

variable "InstanceId" {
    type = string
}
variable "aws_region" {
    description = "EC2 Region for the VPC"
   }