## Outputs (outputs.tf)


output "s3_bucket_name" {
  description = "S3 Bucket endpoint"
  value       = module.storage.s3_bucket_name
}

output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = module.database.rds_endpoint
}

output "iam_role_name" {
  description = "IAM role assigned to EC2"
  value       = module.iam.iam_role_name
}
