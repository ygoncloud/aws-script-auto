## Variables (Variables.tf)
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH keypair name"
  default     = "your-keypair"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0" # Example AMI for us-east-1, please update
}

variable "bucket_name" {
  description = "S3 bucket name"
  default     = "my-unique-s3-bucket-name"
}

variable "db_name" {
  description = "RDS database name"
  default     = "yourdatabase"
}

variable "db_username" {
  description = "RDS database username"
  default     = "admin"
}

variable "db_password" {
  description = "RDS database password"
  sensitive   = true
}
