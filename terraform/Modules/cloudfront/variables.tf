variable "oac_name" {
   description = "name of the cloudfront origin access control"
   type = string
}

variable "domainName" {
    description = "domain name of static website"
    type = string
}

variable "cdn_domain_name" {
   description = "value"
   type = string
}


variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}
