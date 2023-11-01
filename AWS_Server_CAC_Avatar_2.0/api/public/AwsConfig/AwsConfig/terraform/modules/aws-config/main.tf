resource "aws_config_config_rule" "r" {
  name = var.name

  source {
    owner             = "AWS"
    source_identifier = var.rules
  }

  depends_on = [aws_config_configuration_recorder.example_recorder]
}

resource "aws_config_configuration_recorder" "example_recorder" {
name = "${var.name}-recorder"
role_arn = aws_iam_role.example_role.arn
recording_group {
all_supported = true  #Specifies whether AWS Config records configuration changes for every supported type of regional resource (which includes any new type that will become supported in the future). Conflicts with resource_types. Defaults to true.
#resource_types = var.resource_types
}
}

resource "aws_config_delivery_channel" "example_channel" {
name = "${var.name}-channel"
s3_bucket_name  = var.s3_bucket # Replace with your desired S3 bucket name

snapshot_delivery_properties {
delivery_frequency = "One_Hour"
}
depends_on     = [aws_config_configuration_recorder.example_recorder]
}

resource "aws_iam_role" "example_role" {
name = "${var.name}-role"

assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Action = "sts:AssumeRole"
Effect = "Allow"
Sid = ""
Principal = {
Service = "config.amazonaws.com"
}
}
]
})
}

resource "aws_config_configuration_recorder_status" "example_recorder_status" {
name = aws_config_configuration_recorder.example_recorder.name

is_enabled = true
depends_on = [aws_config_delivery_channel.example_channel]
}

resource "aws_iam_role_policy_attachment" "example_policy_attachment" {
policy_arn = var.policy_arn # Replace with the appropriate IAM policy ARN for AWS Config

role = aws_iam_role.example_role.name
}