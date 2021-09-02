# terraform version: v1.0.3
terraform {
  required_version = "=1.0.3"
}
provider "aws" {
  region                  = "us-west-1"
  version                 = "~> 3"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "aws-ci-intern-deploy"
}
