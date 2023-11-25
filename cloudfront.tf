# ********* CloudFront Distribution with S3 bucket as origin ********

locals {
  s3_origin_id = "S3Prod_Origin_ID"
}

resource "aws_cloudfront_origin_access_identity" "S3Prod_OAI" {
  comment = "Some comment for OAI"
}

resource "aws_cloudfront_origin_access_control" "S3Prod_cdn_origin-access-control" {
    name                              = "S3Prod_Orgin access control"
    description                       = "This is an origin access control for my S3 static website"
    origin_access_control_origin_type = "s3"
    signing_behavior                  = "always"
    signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.S3Prod_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.S3Prod_cdn_origin-access-control.id
    origin_id                = local.s3_origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.S3Prod_OAI.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Comment about deploying CDN for my S3 bucket"
  default_root_object = "index.html"

#   logging_config {
#     include_cookies = false
#     bucket          = aws_s3_bucket.s3prod_log.bucket
#     prefix          = "myprefix"
#   }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all" # --- I will change this to 'redirect-to-https' after initial deployment
    min_ttl                = 0
    default_ttl            = 3600        # --- I'll play around with the TTL after initial deployment
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Name = "S3Prod_content distribution"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}  


