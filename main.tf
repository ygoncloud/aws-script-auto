# AWS Terraform - Complete Infrastructure

## Main Configuration (main.tf)
provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./networking"
}

module "compute" {
  source = "./compute"
  subnet_ids = [module.networking.main_subnet_id, module.networking.secondary_subnet_id]
  security_group_id = module.networking.web_sg_id
  alb_security_group_id = module.networking.alb_sg_id
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
}

module "storage" {
  source = "./storage"
}

module "database" {
  source = "./database"
  security_group_id = module.networking.db_sg_id
  db_subnet_group_name = module.networking.db_subnet_group_name
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "iam" {
  source = "./iam"
}

module "monitoring" {
  source = "./monitoring"
}

module "cicd" {
  source = "./cicd"
  project_name = "my-aws-project"
}
