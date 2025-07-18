module "s3" {
  source = "./modules/s3"
}


module "iam" {
  source      = "./modules/iam"
  bucket_name = module.s3.bucket-name
}


provider "aws" {
  alias  = "lpp"
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::217471730172:role/terraform-execution-role"
  }
}


output "execution_role_arn" {
  description = "ARN for the role that allow action via terraform"
  value       = module.iam.execution_role_arn
}


output "bucket-name" {
  description = "Name of the S3 bucket created"
  value       = module.s3.bucket-name
}

output "hosting_url" {
  value = module.s3.hosting_url
}
