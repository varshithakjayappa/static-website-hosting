data "aws_route53_zone" "hosted" {
  name = var.domainName
}


#acm-certificate validation record
resource "aws_route53_record" "cert_validation" {
 for_each = {
    for dvo in var.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
    
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.hosted.zone_id
}

resource "aws_acm_certificate_validation" "validate-cert" {
  certificate_arn         = var.certificateArn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
  depends_on = [ aws_route53_record.cert_validation ]
}

resource "aws_route53_record" "cdn_domain_name" {
  zone_id = data.aws_route53_zone.hosted.zone_id
  name    = var.domainName
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
