# Why this is not required?
# resource "aws_s3_bucket_policy" "access-to-s3" {
#   bucket = var.bucket_name
#   policy = aws_iam_policy.allow-s3.
# }

resource "aws_iam_policy" "allow-s3" {
  name        = "allow-s3-access"
  description = "Policy to allow access to S3 bucket, for reading and writing"
  path        = "/poc"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowGetObject"
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:PutObject"]
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

variable "bucket_name" {
  description = "Name of S3 bucket in discussion"
  type        = string
}
