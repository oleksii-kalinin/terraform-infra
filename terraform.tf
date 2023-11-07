terraform {
  cloud {
    organization = "Tpix"
    workspaces {
      name = "terraform"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.24"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}