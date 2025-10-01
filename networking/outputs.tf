output "web_sg_id" {
  description = "The ID of the web security group"
  value       = aws_security_group.web_sg.id
}

output "db_sg_id" {
  description = "The ID of the database security group"
  value       = aws_security_group.db_sg.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.main_subnet.id
}

output "db_subnet_group_name" {
  description = "The name of the database subnet group"
  value       = aws_db_subnet_group.db_subnet_group.name
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.main_alb.dns_name
}

output "main_subnet_id" {
  description = "The ID of the main subnet"
  value       = aws_subnet.main_subnet.id
}

output "secondary_subnet_id" {
  description = "The ID of the secondary subnet"
  value       = aws_subnet.secondary_subnet.id
}
