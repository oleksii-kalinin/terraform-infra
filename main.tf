resource "random_string" "s3_bucket_name" {
  length = 8
  special = false
}

resource "aws_s3_bucket" "terraform_state" {
  bucket_prefix = "${random_string.s3_bucket_name.id}-state"

  tags = {
    Owner = "terraform"
  }
}