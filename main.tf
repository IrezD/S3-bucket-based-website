provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "value"
    key = "terraformstate.tf"
    region = "eu-central-1"
  }
}