
# sns topic

resource "aws_sns_topic" "example_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "example_subscription" {
  for_each = { for email in var.email_addresses : email => email }

  topic_arn                       = aws_sns_topic.example_topic.arn 
  protocol                        = var.protocol_name
  confirmation_timeout_in_minutes = var.confirmation_timeout_in_minutes
  endpoint_auto_confirms          = var.endpoint_auto_confirms
  endpoint                        = each.value
}
