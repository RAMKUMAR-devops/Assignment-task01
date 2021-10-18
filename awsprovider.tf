terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "terraformbackend01"
    key = "LockID"
    region = "us-east-1"
    dynamodb_table = "terraform-locking"
  }
}
