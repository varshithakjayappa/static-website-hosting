resource "aws_acm_certificate" "cert" {
  domain_name       = var.domainName
  validation_method = "DNS"
  subject_alternative_names = ["www.${var.domainName}"]  
  lifecycle {
    create_before_destroy = true
  }
}