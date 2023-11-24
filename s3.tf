
# ********* S3 website content bucket ********

resource "aws_s3_bucket" "S3Prod_bucket" {
  bucket = "s3prod-static-website001"
  tags = {
    Name = "S3Prod tf-static website"
  }
}

# resource "aws_s3_bucket_acl" "S3Prod_acl" {
#   bucket = aws_s3_bucket.S3Prod_bucket.id
#   acl       
# }

resource "aws_s3_bucket_versioning" "S3prod_versioning" {
    bucket = aws_s3_bucket.S3Prod_bucket.bucket
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_public_access_block" "S3Prod_publicPolicy" {
    bucket = aws_s3_bucket.S3Prod_bucket.bucket
    
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true

}

# resource "aws_s3_bucket_policy" "S3Prod_JsonPolicy" {
#     bucket = aws_s3_bucket.S3Prod_bucket.bucket

#     policy = jsonencode({
#             "Id": "Policy1699808862649",
#             "Version": "2012-10-17",
#             "Statement": [
#                 {
#                 "Sid": "Stmt1699808856097",
#                 "Action": [
#                     "s3:GetObject"
#                 ],
#                 "Effect": "Allow",
#                 "Resource": "arn:aws:s3:::s3prod-static-website001/*",
#                 "Principal": "*"
#                 }
#   ]
# })
# }


resource "aws_s3_bucket_website_configuration" "S3Prod_index" {
  bucket = aws_s3_bucket.S3Prod_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "S3Prod_content" {
  bucket = aws_s3_bucket.S3Prod_bucket.bucket
  key    = "index.html"
  source = "index.html"
  etag = filemd5("index.html")

}

resource "aws_s3_object" "S3Prod_content-image" {
  bucket = aws_s3_bucket.S3Prod_bucket.bucket
  key    = "profile-photo.jpg"
  source = "profile-photo.jpg"
  etag = filemd5("profile-photo.jpg")

}

# # ********* S3 bucket to store logs ********

# resource "aws_s3_bucket" "s3prod_log" {
#   bucket = "s3prod-access-logs001"
#   tags = {
#     Name = "S3 Production logs"
#   }
# }