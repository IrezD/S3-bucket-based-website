resource "aws_route53_record" "s3Prod_cdn_config" {
  zone_id = "Z0822301268JPSC1M6XE6"
  name    = "dennisowie.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.s3_distribution.dns_name
    zone_id                = aws_cloudfront_distribution.s3_distribution.zone_id
    evaluate_target_health = true
  }
}