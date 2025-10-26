variable "domainName" {
    description = "domain name of static website"
    type = string
}

variable "certificateArn" {
  description = "value"
  type = string
}

variable "domain_validation_options" {
  description = "List of validation options for ACM"
  type        = any
}

variable "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  type        = string
}

variable "cloudfront_zone_id" {
  description = "CloudFront distribution hosted zone ID"
  type        = string
}