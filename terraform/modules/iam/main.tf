# Why this is not required?
# resource "aws_s3_bucket_policy" "access-to-s3" {
#   bucket = var.bucket_name
#   policy = aws_iam_policy.allow-s3.
# }

resource "aws_iam_role" "terraform_execution_role" {
  name = "terraform-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::217471730172:user/admin"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

output "execution_role_arn" {
  description = "ARN for the role that allow action via terraform"
  value       = aws_iam_role.terraform_execution_role.arn
}

resource "aws_iam_policy" "allow_s3" {
  provider    = aws.root
  name        = "allow-s3-access"
  description = "Policy to allow access to S3 bucket, for reading and writing"
  path        = "/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "AllowGetObject"
        Effect   = "Allow"
        Action   = ["s3:GetObject", "s3:PutObject", "s3:ListObject"]
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

# data "aws_caller_identity" "current" {}

# resource "aws_iam_policy_attachment" "allow_get_put_over_s3" {
#   name       = "allow-get-put-over-s3"
#   policy_arn = aws_iam_policy.allow_s3.arn
#   users      = data.aws_caller_identity.current.user_id
# }

variable "bucket_name" {
  description = "Name of S3 bucket in discussion"
  type        = string
}

provider "aws" {
  alias  = "root"
  region = "us-east-2"
}
