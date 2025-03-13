## RDS Database (database/rds-instance.tf)
resource "aws_db_instance" "my_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = "mydatabase"
  username           = "admin"
  password           = "mysecurepassword"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot = true
  publicly_accessible = false
  multi_az            = false

  vpc_security_group_ids = ["sg-xxxxxxx"]
  db_subnet_group_name   = "my-db-subnet-group"

  tags = {
    Name = "MyRDSInstance"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.my_rds.endpoint
}
