output "dns_records" {
  value = aws_route53_record.cert_validation
}

output "zone_id" {
  value = data.aws_route53_zone.hosted.zone_id
}