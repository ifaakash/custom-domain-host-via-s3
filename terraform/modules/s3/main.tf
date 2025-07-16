resource "aws_s3_bucket" "s3" {
  region              = "us-east-2"
  bucket_prefix       = "poc-"
  force_destroy       = true
  object_lock_enabled = false
  tags = {
    "Project" : "PoC"
  }
}


output "bucket-name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.s3.id
}
