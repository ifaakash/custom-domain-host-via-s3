resource "aws_s3_bucket" "s3" {
  region              = "us-east-2"
  bucket_prefix       = "poc-"
  force_destroy       = true
  object_lock_enabled = false
  tags = {
    "Project" : "PoC"
  }
}

resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.s3.id
  index_document {
    suffix = "landing.html"
  }
  error_document {
    key = "error.html"
  }
}


output "bucket-name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.s3.id
}
