terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4PWKKJG7E5LJIAH7"
  secret_key = "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"
}
