## RDS Database (database/rds-instance.tf)
resource "aws_db_instance" "my_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = var.db_name
  username           = var.db_username
  password           = aws_secretsmanager_secret_version.db_password_version.secret_string
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot = true
  publicly_accessible = false
  multi_az            = false

  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = var.db_subnet_group_name

  tags = {
    Name = "MyRDSInstance"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}
