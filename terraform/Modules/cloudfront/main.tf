
resource "aws_cloudfront_origin_access_control" "s3_origin" {
  name                              = var.oac_name
  description                       = "An origin access control with s3 origin domain"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution_cdn" {
  origin {
    domain_name = var.cdn_domain_name
    origin_id   = var.cdn_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_origin.id
  }
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases = [var.domainName, "www.${var.domainName}"]
  # AWS Managed Caching Policy (CachingDisabled)
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.cdn_domain_name
    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400

    forwarded_values {
      query_string = false

      cookies {
        forward = "all"
      }
    }

  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  
  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  
}

