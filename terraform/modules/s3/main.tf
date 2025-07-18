resource "aws_s3_bucket" "s3" {
  region              = "us-east-2"
  bucket_prefix       = "poc-"
  force_destroy       = true
  object_lock_enabled = false
  tags = {
    "Project" : "PoC"
  }
}

resource "aws_s3_object" "landing_page" {
  bucket       = aws_s3_bucket.s3.id
  key          = "index.html"
  source       = "index.html"
  content_type = var.content_type
}

resource "aws_s3_object" "error_page" {
  bucket       = aws_s3_bucket.s3.id
  key          = "error.html"
  source       = "error.html"
  content_type = var.content_type
}


resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.s3.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:*"],
        Resource  = "${aws_s3_bucket.s3.arn}/*"
      }
    ]
  })
}


resource "aws_s3_bucket_website_configuration" "s3_hosting" {
  bucket = aws_s3_bucket.s3.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
output "hosting_url" {
  value = aws_s3_bucket_website_configuration.s3_hosting.website_endpoint
}



resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  bucket                  = aws_s3_bucket.s3.id
  block_public_policy     = false
  block_public_acls       = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


output "bucket-name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.s3.id
}


variable "content_type" {
  type    = string
  default = "text/html"
}
