resource "aws_secretsmanager_secret" "secret" {
  name = var.name
}

resource "aws_secretsmanager_secret_version" "value" {
  count = var.value == null ? 0 : 1

  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(var.value)
}
