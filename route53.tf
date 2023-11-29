resource "aws_route53_record" "s3Prod_cdn_config" {
  zone_id = "Z0822301268JPSC1M6XE6"
  name    = "dennisowie.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "s3Prod_test-cdn" {
  zone_id = "Z0822301268JPSC1M6XE6"
  name    = "test.dennisowie.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}