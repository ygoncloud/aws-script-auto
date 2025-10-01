variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the instances will be launched"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the instances"
  type        = string
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}
