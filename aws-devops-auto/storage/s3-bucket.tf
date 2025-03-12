## S3 Bucket (storage/s3-bucket.tf)
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-s3-bucket-name"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

