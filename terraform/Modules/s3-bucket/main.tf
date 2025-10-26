resource "aws_s3_bucket" "static_web_bucket" {
  bucket = var.bucketName

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "object" {
  for_each = fileset("${var.web_path}", "**")
  bucket = aws_s3_bucket.static_web_bucket.id
  key    = each.value
  source = "${var.web_path}/${each.value}"
  content_type = lookup(var.mime_types, regex(".*\\.(.*)$", each.value)[0], "application/octet-stream")
}

resource "aws_s3_bucket_policy" "cloudfront-oac-policy" {
  bucket = aws_s3_bucket.static_web_bucket.bucket
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowCloudFrontServicePrincipal",
        Effect = "Allow",
        Principal = {
          Service = "cloudfront.amazonaws.com"
        },
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.static_web_bucket.arn}/*",
      }
    ]
  })
}