provider "aws" {
  region              = "us-east-1"
  shared_config_files = [var.tfc_aws_dynamic_credentials.default.shared_config_file]
  default_tags {
    tags = {
      Owner = "terraform"
    }
  }
}