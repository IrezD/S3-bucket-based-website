provider "aws" {
  region = "eu-central-1"
}


resource "aws_s3_bucket_versioning" "Tfstate_versioning" {
  bucket = "s3prod-tfstatefile001"
  versioning_configuration {
    status = "Enabled"
  }
}

terraform {
  backend "s3" {
    bucket = "s3prod-tfstatefile001"
    key = "S3_terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "dynamoDB_tfstate-lock"
  }
}





