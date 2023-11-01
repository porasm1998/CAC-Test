resource "aws_secretsmanager_secret" "main" {
  name = var.name
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id     = aws_secretsmanager_secret.main.id
  secret_string = jsonencode(var.secret_string)
}