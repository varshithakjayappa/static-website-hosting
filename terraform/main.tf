module "s3_bucket" {
  source = "./Modules/s3-bucket"
  bucketName = var.bucket_name
  web_path = var.web_path
  
}

module "acm" {
  source = "./Modules/acm"
  domainName = var.domainName
}

module "route53" {
  source = "./Modules/route53"
   certificateArn = module.acm.cert_arn
   domain_validation_options = module.acm.domain_validation_options
   domainName = var.domainName
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  cloudfront_zone_id = module.cloudfront.cloudfront_hosted_zone_id

}

module "cloudfront" {
  source = "./Modules/cloudfront"
  domainName = var.domainName
  cdn_domain_name = module.s3_bucket.bucket_regional_domain_name
  acm_certificate_arn = module.acm.cert_arn
  oac_name = var.oac_name
 
}
