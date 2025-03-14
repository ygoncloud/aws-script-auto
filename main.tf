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
  subnet_id = module.networking.subnet_id
  security_group_id = module.networking.web_sg_id
}

module "storage" {
  source = "./storage"
}

module "database" {
  source = "./database"
  security_group_id = module.networking.db_sg_id
  db_subnet_group_name = module.networking.db_subnet_group_name
}

module "iam" {
  source = "./iam"
}

module "monitoring" {
  source = "./monitoring"
}
