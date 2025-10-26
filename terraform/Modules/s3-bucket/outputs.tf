output "bucket_regional_domain_name"{
    description = "bucket domain name"
    value = aws_s3_bucket.static_web_bucket.bucket_regional_domain_name
}