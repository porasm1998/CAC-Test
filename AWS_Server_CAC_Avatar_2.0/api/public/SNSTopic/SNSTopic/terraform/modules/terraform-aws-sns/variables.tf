// Below are variables specific to user account and region
variable "aws_region" {
  default     = ""
}

// Below are variables specific to SNS
 variable "sns_subscription_email_address_list" {
   type = list(string)
   description = "List of email addresses"
   default = [""]
 }
 
 variable "sns_subscription_protocol" {
   type = string
   description = "SNS subscription protocal"
   default =  "email"
 }
 
 variable "sns_topic_name" {
   type = string
   description = "SNS topic name"
   default = ""
 }

 variable "sns_topic_display_name" {
   type = string
   description = "SNS topic display name"
   default = "snstopic"
 }
 
variable "stack_name" {
  type   = string
  description = "Unique Cloudformation stack name that wraps the SNS topic."
  default = "snsStack1"
}