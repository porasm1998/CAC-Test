
variable "topic_name" {
  type        = string
  description = "The name of the SNS topic"
}

variable "email_addresses" {
  type        = list(string)
  description = "The email addresses to subscribe to the SNS topic"
}

variable "protocol_name" {

  type        = string
  description = "(Required) Protocol to use. Valid values are: sqs, sms, lambda, firehose, and application. Protocols email, email-json, http and https are also valid but partially supported."
  default     = "email"
}

variable "confirmation_timeout_in_minutes" {
  type        = string
  description = "(Optional) Integer indicating number of minutes to wait in retrying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols. "
  default     = 1
}

variable "endpoint_auto_confirms" {
  type        = string
  description = " (Optional) Whether the endpoint is capable of auto confirming subscription (e.g., PagerDuty)."
  default     = "false"
}

variable "raw_message_delivery" {
  type        = string
  description = "(Optional) Whether to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property)"
  default     = "false"
}