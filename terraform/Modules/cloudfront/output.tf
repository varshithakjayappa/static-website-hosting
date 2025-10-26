output "cloudfront_arn" {
  value = aws_cloudfront_distribution.s3_distribution_cdn.arn
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution_cdn.domain_name
}

output "cloudfront_hosted_zone_id" {
  value = aws_cloudfront_distribution.s3_distribution_cdn.hosted_zone_id
}