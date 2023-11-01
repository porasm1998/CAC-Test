//This template will created glue crawler role for AWS Glue service

//Create an IAM Role for  Workflows

resource "aws_iam_role" "workflow_role" {
  name =var.glue_crawler_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "glue.amazonaws.com"
        }
      },
    ]
  }
  )
}

resource "aws_iam_role_policy_attachment" "AWSGlueServiceRoleAttach" {
  role = aws_iam_role.workflow_role.id
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}
/* resource "aws_iam_policy" "example_policy" {
  name        = "example_policy"
  description = "Example IAM policy for Lake Formation permissions"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "LakeFormationDataLocationAccess",
      "Effect": "Allow",
      "Action": [
        "lakeformation:GetDataAccess",
        "lakeformation:GrantPermissions",
        "lakeformation:RevokePermissions"
      ],
      "Resource": "arn:aws:lakeformation:us-west-1:181597866704:datalake/us-west-1a"
    },
    {
      "Sid": "LakeFormationDatabaseCreation",
      "Effect": "Allow",
      "Action": [
        "lakeformation:CreateDatabase",
        "glue:CreateDatabase"
      ],
      "Resource": "*"
    }
  ]
}
EOF
} */



