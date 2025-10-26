output "bucket-name" {
  value = module.s3_bucket.bucket_regional_domain_name
}

output "domain_validation_options" {
  value = module.acm.domain_validation_options
}
