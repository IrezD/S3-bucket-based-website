provider "aws" {
  region = "eu-central-1"
}

# terraform {
#   backend "s3" {
#     bucket = "value"
#     key = "terraformstate.tf"
#     region = "eu-central-1"
#   }
# }

# resource "aws_vpc" "S3Prod" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "S3 Website Host"
#   }
# }

# resource "aws_subnet" "S3Prod" {
#     vpc_id = aws_vpc.S3Prod.id
#     cidr_block = "10.0.1.0/24"
#     tags = {
#         Name = "S3 Website Subnet"
#     }
# }

