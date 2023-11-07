resource "random_string" "s3_bucket_name" {
  length = 8
  special = false
  lower = true
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${random_string.s3_bucket_name.id}-state"

  tags = {
    Owner = "terraform"
  }
}

resource "aws_s3_bucket_acl" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  acl = "private"
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}