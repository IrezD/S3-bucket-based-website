
# ********* S3 website content bucket ********

resource "aws_s3_bucket" "S3Prod_bucket" {
  bucket = "s3prod-static-website001"
  tags = {
    Name = "S3Prod Production"
  }
}

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

data "aws_iam_policy_document" "s3Prod_policy" {
  statement {
    sid = "CloudFrontCachingfromPrivateS3"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.S3Prod_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [aws_cloudfront_distribution.s3_distribution.arn]
    }
  }
}


resource "aws_s3_bucket_policy" "S3Prod_JsonPolicy" {
    bucket = aws_s3_bucket.S3Prod_bucket.bucket
    policy = data.aws_iam_policy_document.s3Prod_policy.json

}


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