# Sagemaker Instance

resource "aws_sagemaker_notebook_instance" "default" {
  name            = var.name
  instance_type   = var.instance_type
  role_arn        = aws_iam_role.sagemaker_instance_role.arn

  tags = {
    name = "${var.name} - Sagemaker Instance"
  }
}

resource "aws_iam_role" "sagemaker_instance_role" {
  name = "${var.name}-sagemaker_instance_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"]
  tags = {
    name = "${var.name} - Sagemaker Instance"
  }
}