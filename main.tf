resource "random_string" "s3_bucket_name" {
  length = 8
  special = false
  upper = false
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${random_string.s3_bucket_name.id}-state"

  tags = {
    Owner = "terraform"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "${random_string.s3_bucket_name.id}-lock"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}