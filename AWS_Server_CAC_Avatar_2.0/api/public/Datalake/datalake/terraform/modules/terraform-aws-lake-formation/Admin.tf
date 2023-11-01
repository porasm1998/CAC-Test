// Create a Data Lake Administrator

resource "aws_iam_user" "datalake_admin" {
  name       = var.data_lake_admin
}

// Attach policy to admin
resource "aws_iam_user_policy_attachment" "Attach-AdministratorAccess" {
  user       = aws_iam_user.datalake_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

// Data Lake Admins, Create Database and Default Permissions

resource "aws_lakeformation_data_lake_settings" "datalake_admins" {
  admins     = [aws_iam_user.datalake_admin.arn]
}