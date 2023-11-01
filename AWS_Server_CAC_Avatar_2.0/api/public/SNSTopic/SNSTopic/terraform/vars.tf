// Below are variables specific to user account and other componenets 

variable "aws_region" {
  description = "EC2 Region for the VPC"
}

// Below are variables specific to SNS
variable "sns_subscription_email_address_list" {
  type        = list(string)
  description = "List of email addresses"
}
variable "sns_topic_name" {
  type        = string
  description = "SNS topic name"
}

variable "stack_name" {
  type   = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
  default = "snsStack1"
}