resource "aws_secretsmanager_secret" "db_password" {
  name        = "${var.db_name}-password"
  description = "RDS database password for ${var.db_name}"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = var.db_password
}
